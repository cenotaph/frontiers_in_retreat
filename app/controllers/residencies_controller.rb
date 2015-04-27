class ResidenciesController < ApplicationController
  respond_to :html
  
  def index
    @site = Site.find(params[:site_id])
    @residencies = @site.residencies
    if request.xhr?
      render :layout => false
    end
  end
  
end