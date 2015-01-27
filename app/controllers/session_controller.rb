class SessionController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.where(fid: auth_hash['uid']).first 
    if user == nil
      user = User.create(fid: auth_hash['uid'], avatar: auth_hash[:info][:image], name: auth_hash['info']['name'])
      user.save
      session[:user_id] = user.id
    else
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
