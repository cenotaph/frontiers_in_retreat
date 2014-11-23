class Admin::ResidenciesController < Admin::BaseController
  
  def create
    create! { admin_residencies_path }
  end
  
  def update
    update! { admin_residencies_path }
  end
  
  protected
  
  def residency_params
    params.require(:residency).permit(:artist_id, :site_id, :start_at, :end_at, :description, :slug )
  end
  
end
