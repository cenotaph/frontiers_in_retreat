class Admin::PagesController < Admin::BaseController
  
  def create
    create! { admin_pages_path }
  end
  
  def update
    update! { admin_pages_path }
  end
  
  protected
  
  def page_params
    params.require(:page).permit(:title, :body, :published, :slug)
  end
  
end