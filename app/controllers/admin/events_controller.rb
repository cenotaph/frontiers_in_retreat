class Admin::EventsController < Admin::BaseController
  
  def create
    create! { admin_events_path }
  end
  
  def update
    update! { admin_events_path }
  end
  
  protected
  
  def event_params
    params.require(:event).permit(:site_id, :start_at, :end_at, :published, :name, :image, :description, :slug, residency_ids: [ ] )
  end
  
end
