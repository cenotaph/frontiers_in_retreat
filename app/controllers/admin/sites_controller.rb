class Admin::SitesController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @site = Site.create(site_params)
    respond_with @site, location: -> { admin_sites_path}
  end
  
  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to admin_sites_path
  end
  
  def edit
    @site = Site.find(params[:id])
    set_meta_tags title: "Edit site"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "location"
        "country #{direction}, city #{direction}"
      when "name"
        "name #{direction}"
      when "current"
        "current #{direction}"
      when "id"
        "id #{direction}"
      else
        "name ASC"
      end
    end
    @sites = Site.unscoped.all.order(order)
    set_meta_tags title: 'Sites'
  end
  
  def new
    @site = Site.new
    set_meta_tags title: 'New site'
  end 
   
  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(site_params)
      respond_with @site,  location: -> { admin_sites_path}
    end

  end
  
  protected
  
  def site_params
    params.require(:site).permit(:name, :city, :country, :lead, :slug, :website, :address, :description, :latitude, :longitude, :current, :image)
  end
  
end