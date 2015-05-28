class Admin::PagesController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @page = Page.create(page_params)
    respond_with @page, location: -> { admin_pages_path}
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path
  end
  
  def edit
    @page = Page.find(params[:id])
    set_meta_tags title: "Edit page"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "title"
        "lower(#{column}) #{direction}"
      when "id"
        "id #{direction}"
      when "published"
        "published #{direction}"
      else
        "lower(title) ASC"
      end
    end
    @pages = Page.all.order(order).page(params[:page]).per(25)
    set_meta_tags title: 'Pages'
  end
  
  def new
    @page = Page.new
    set_meta_tags title: 'New page'
  end 
   
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      respond_with @page,  location: -> { admin_pages_path}
    end

  end

  protected
  
  def page_params
    params.require(:page).permit(:title, :body, :published, :slug)
  end
  
end