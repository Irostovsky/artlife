class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!, :set_default_locale
  layout 'admin'

private

   def set_default_locale
     I18n.locale = 'en'
   end

end
