class Admin::SitesController < Admin::BaseController
  
  def create
    create! { admin_sites_path }
  end
  
  def update
    update! { admin_sites_path }
  end
  
  protected
  
  def site_params
    params.require(:site).permit(:name, :city, :country, :lead, :slug, :website, :address, :description, :latitude, :longitude, :current, :image)
  end
  
end