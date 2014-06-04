class SitesController < InheritedResources::Base
  actions :index, :show
  
  def index
    @sites = Site.current
    render :layout => false
  end
  
  def show
    @site = Site.current.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
end