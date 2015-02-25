class OpinionsController < ApplicationController

  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month

    @opinions = OpinionCollection.new(@year, @month)

    respond_to do |format|
      format.json { render text: @opinions.to_a.to_json }
      format.html
    end
  end

end
