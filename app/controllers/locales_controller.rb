class LocalesController < ApplicationController
  
  def update
    uri = session[:uri] || ''
    locale = params[:id]
    cookies['locale'] = { :value => locale, :expires => 1.year.from_now }
    redirect_to uri
  end
  
private
  
  def save_uri
  end
end
