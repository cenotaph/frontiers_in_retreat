class Admin::UsersController < Admin::BaseController
  actions :edit, :update, :destroy, :index
  
  
  def update
    update! { admin_users_path }
  end
  
  protected
  
  def user_params
    params.require(:user).permit(:site_id, :approved, :email, :username)
  end
  
end