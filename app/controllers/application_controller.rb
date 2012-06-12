class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'public'

  before_filter :save_uri
  before_filter :load_locale

   # Scrub sensitive parameters from your log
   # filter_parameter_logging :password

private

   def load_locale
     I18n.locale = cookies['locale'] || 'en'
   end

   def save_uri
     session[:uri] = request.fullpath
   end

end
