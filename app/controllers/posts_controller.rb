class PostsController < ApplicationController
  has_scope :page, :default => 1

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