class ResidenciesController < ApplicationController
  respond_to :html
  
  def index
    if params[:site_id]
      @site = Site.find(params[:site_id])
      @residencies = @site.residencies
    elsif params[:artist_id]
      @artist = Artist.find(params[:artist_id])
      @residencies = @artist.residencies
    end
    if request.xhr?
      render :layout => false
    end
  end
  
end