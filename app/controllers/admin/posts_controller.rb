class Admin::PostsController < Admin::BaseController

  def create
    create! { admin_posts_path }
  end
  
  def update
    update! { admin_posts_path }
  end
  
  protected
  
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :published, :slug, :published_at, images_attributes: [:caption, :credit, :image, :id, :_destroy])
  end
  
end
