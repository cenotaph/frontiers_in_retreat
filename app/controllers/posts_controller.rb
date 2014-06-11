class PostsController < InheritedResources::Base
  has_scope :page, :default => 1
  actions :index, :show
  
  def index
    @posts = Post.published.order('published_at DESC').page(params[:page])
    render :layout => false
  end
  
  def show
    @post = Post.published.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
end