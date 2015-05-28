class Admin::EventsController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @event = Event.create(event_params)
    respond_with @event, location: -> { admin_events_path}
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path
  end
  
  def edit
    @event = Event.find(params[:id])
    set_meta_tags title: "Edit event"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "site"
        "sites.name #{direction}"
      when "when"
        "start_at #{direction}"
      when "name"
        "name #{direction}"
      else
        "start_at DESC"
      end
    end
    @events = Event.joins(:site).all.order(order).page(params[:page]).per(25)
    set_meta_tags title: 'Events'
  end
  
  def new
    @event = Event.new
    set_meta_tags title: 'New event'
  end 
   
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      respond_with @event,  location: -> { admin_events_path}
    end

  end
  
  protected
  
  def event_params
    params.require(:event).permit(:site_id, :start_at, :end_at, :published, :name, :image, :description, :slug, residency_ids: [ ] )
  end
  
end
