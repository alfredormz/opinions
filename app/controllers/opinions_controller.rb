class OpinionsController < ApplicationController

  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month

    @opinions = OpinionCollection.new(@year, @month).to_a

    respond_to do |format|
      format.json { render text: @opinions.to_json }
    end
  end

end
