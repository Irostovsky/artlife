class Admin::HomeController < Admin::BaseController
  before_filter :authenticate_user!

  def index
  end

end
