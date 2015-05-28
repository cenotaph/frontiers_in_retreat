class PagesController < ApplicationController

  def show
    @page = Page.published.find(params[:id])
    if request.xhr?
      render :layout => false
    end
  end
  
end