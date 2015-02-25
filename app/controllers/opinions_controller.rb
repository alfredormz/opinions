class OpinionsController < ApplicationController

  def index
    @year = params[:year] || Date.today.year
    @month = params[:month] || Date.today.month

    @opinions = SiteParser.call(@year, @month)
    respond_to do |format|
      format.json { render text: @opinions.to_json }
    end
  end

end
