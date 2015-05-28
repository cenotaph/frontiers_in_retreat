class Admin::ProjectsController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @project = Project.create(project_params)
    respond_with @project, location: -> { admin_projects_path}
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path
  end
  
  def edit
    @project = Project.find(params[:id])
    set_meta_tags title: "Edit project"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "when"
        "start_at #{direction}"
      when "name"
        "name #{direction}"
      else
        "start_at DESC"
      end
    end
    @projects = Project.all.order(order).page(params[:page]).per(25)
    set_meta_tags title: 'Projects'
  end
  
  def new
    @project = Project.new
    set_meta_tags title: 'New project'
  end 
   
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      respond_with @project,  location: -> { admin_projects_path}
    end

  end
  protected
  
  def project_params
    params.require(:project).permit(:name, :description, :slug, :start_at, :weblink, :end_at, residency_ids: [ ], images_attributes: [:caption, :credit, :image, :id, :_destroy] )
  end
  
end
