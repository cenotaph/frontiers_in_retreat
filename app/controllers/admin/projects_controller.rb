class Admin::ProjectsController < Admin::BaseController
  
  def create
    create! { admin_projects_path }
  end
  
  def update
    update! { admin_projects_path }
  end
  
  protected
  
  def project_params
    params.require(:project).permit(:name, :description, :slug, :start_at, :weblink, :end_at, residency_ids: [ ], images_attributes: [:caption, :credit, :image, :id, :_destroy] )
  end
  
end
