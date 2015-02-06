class CritiquesController < ApplicationController

  def index
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

  def generate_chart_data (setting_type, setting_array)
    # you need to do a tally - what proportion were too high? too low? just right?
    # define your middle bucket
      # find ne
    # for a photo, get the value used
    # walk through each critique for that photo (use get_critiques helper)
    # increment appropriate bucket with each step
    # middle bucket -> one above and one below
    
  end

end
