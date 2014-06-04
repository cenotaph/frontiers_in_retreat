class PostsController < InheritedResources::Base
  has_scope :page, :default => 1
  
  def index
    @posts = Post.published
    render :layout => false
  end
  
  def show
    @post = Post.published.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
end