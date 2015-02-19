class CritiquesController < ApplicationController

  def index
    #@photos = Photo.all
    @photos = Photo.paginate(page: params[:page], per_page: 15)
    #respond_to do |format|
    #  format.html
    #  format.js
    #end
  end
  
  def submit_critique
    if Critique.where(fid: params[:fid], author: params[:author]).size < 1
      @critique = Critique.create(
        fid: params[:fid],
        author: params[:author],
        sugg_ap: params[:sugg_ap],
        sugg_sh: params[:sugg_sh],
        sugg_iso: params[:sugg_iso]
      ) 
      if params[:sugg_wb]
        @critique.sugg_wb = params[:sugg_wb]
        @critique.save
      end
    end
    render :nothing => true
  end


end
