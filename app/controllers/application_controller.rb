class ApplicationController < ActionController::Base
  #Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  #Add ability to change locals if need be.
  before_action :set_locale


  private
  #Function for changing locals to other languages if need be. 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end

end
