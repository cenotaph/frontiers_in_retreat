class Admin::ArtistsController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @artist = Artist.create(artist_params)
    respond_with @artist, location: -> { admin_artists_path}
  end
  
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to admin_artists_path
  end
  
  def edit
    @artist = Artist.find(params[:id])
    set_meta_tags title: "Edit artist"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "surname"
        "lower(#{column}) #{direction}"
      when "id"
        "id #{direction}"
      when "visible"
        "visible #{direction}"
      else
        "lower(surname) ASC"
      end
    end
    @artists = Artist.all.order(order).page(params[:page]).per(25)
    set_meta_tags title: 'Artists'
  end
  
  def new
    @artist = Artist.new
    set_meta_tags title: 'New artist'
  end 
   
  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      respond_with @artist,  location: -> { admin_artists_path}
    end

  end
  
  protected
  
  def artist_params
    params.require(:artist).permit(:firstname, :surname, :sortname, :bio, :slug, :visible, :website)
  end
  
end
