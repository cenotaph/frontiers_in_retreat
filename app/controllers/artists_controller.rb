class ArtistsController < InheritedResources::Base
  actions :index, :show
  
  def index
    @artists = Artist.visible
    render :layout => false
  end
  
  def show
    @artist = Artist.visible.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
end