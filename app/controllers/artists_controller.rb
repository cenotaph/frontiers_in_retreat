class ArtistsController < ApplicationController
 
  def index
    @artists = Artist.visible.sort_by(&:sortkey)
    render :layout => false
  end
  
  def show
    @artist = Artist.visible.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
end