class Admin::BaseController < InheritedResources::Base
  before_action :authenticate_user!
  layout 'admin'
end