class Admin::ArtistsController < Admin::BaseController
  
  def create
    create! { admin_artists_path }
  end
  
  def update
    update! { admin_artists_path }
  end
  
  protected
  
  def artist_params
    params.require(:artist).permit(:firstname, :surname, :sortname, :bio, :slug, :visible, :website)
  end
  
end
