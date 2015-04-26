class Admin::ResidenciesController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @residency = Residency.create(residency_params)
    respond_with @residency, location: -> { admin_residencies_path}
  end
  
  def destroy
    @residency = Residency.find(params[:id])
    @residency.destroy
    redirect_to admin_residencies_path
  end
  
  def edit
    @residency = Residency.find(params[:id])
    set_meta_tags title: "Edit residency"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "site"
        "sites.name #{direction}"
      when "when"
        "start_at #{direction}"
      when "artist"
        "artists.surname #{direction}"
      else
        "artists.surname ASC"
      end
    end
    @residencies = Residency.all.joins(:site, :artist).order(order).page(params[:page]).per(25)
    set_meta_tags title: 'Residencies'
  end
  
  def new
    @residency = Residency.new
    set_meta_tags title: 'New residency'
  end 
   
  def update
    @residency = Residency.find(params[:id])
    if @residency.update_attributes(residency_params)
      respond_with @residency,  location: -> { admin_residencies_path}
    end

  end
  protected
  
  def residency_params
    params.require(:residency).permit(:artist_id, :site_id, :start_at, :end_at, :description, :slug )
  end
  
end
