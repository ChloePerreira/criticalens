class CritiquesController < ApplicationController
  
  def submit_critique
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
    render :nothing => true
  end
end
