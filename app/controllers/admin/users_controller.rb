class Admin::UsersController < Admin::BaseController
  respond_to :html
  handles_sortable_columns
  
  def create
    @user = User.create(user_params)
    respond_with @user, location: -> { admin_users_path}
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
  
  def edit
    @user = User.find(params[:id])
    set_meta_tags title: "Edit user"
  end


  def index
    order = sortable_column_order do |column, direction|
      case column
      when "email"
        "email #{direction}"
      when "username"
        "username #{direction}"
      when "id"
        "id #{direction}"
      else
        "id ASC"
      end
    end
    @users = User.unscoped.all.order(order)
    set_meta_tags title: 'Users'
  end
  
  def new
    @user = User.new
    set_meta_tags title: 'New user'
  end 
   
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      respond_with @user,  location: -> { admin_users_path}
    end

  end
  protected
  
  def user_params
    params.require(:user).permit(:user_id, :approved, :site_id, :artist_id, :email, :username)
  end
  
end