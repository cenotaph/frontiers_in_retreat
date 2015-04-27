class Admin::PostsController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  has_scope :news, type: :boolean
  has_scope :blog, type: :boolean
  
  def create
    @post = Post.create(post_params)
    respond_with @post, location: -> { admin_posts_path}
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
    set_meta_tags title: "Edit post"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "title"
        "lower(#{column}) #{direction}"
      when "date"
        "greatest(published_at, created_at) #{direction}"
      when "published"
        "published #{direction}"
      else
        "lower(title) ASC"
      end
    end
    @posts = apply_scopes(Post).all.order(order).page(params[:page]).per(25)
    set_meta_tags title: 'Posts'
  end
  
  def new
    @post = Post.new
    set_meta_tags title: 'New post'
  end 
   
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      respond_with @post,  location: -> { admin_posts_path}
    end

  end
  protected
  
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :published, :blog, :slug, :published_at, images_attributes: [:caption, :credit, :image, :id, :_destroy])
  end
  
end
