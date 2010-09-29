# -*- coding: utf-8 -*-
module AuthenticatedSystem

  protected

  def current_user_session
    @current_user_session ||= UserSession.find
  end
  
  def current_user
    @current_user ||= current_user_session && current_user_session.record
  end

  def logged_in?
    !!current_user
  end
  
  def login_required
    logged_in? || access_denied
  end

  def access_denied
    respond_to do |format|
      format.html do
        flash[:error]="Dostęp do tej części strony wymaga zalogowania"
        store_location
        redirect_to login_path
      end
      format.any(:json, :xml) do
        request_http_basic_authentication 'Web Password'
      end
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def get_back_or_default(default)
    session[:return_to] || default
  end
  
  def redirect_back_or_default(default)
    redirect_to get_back_or_default(default)
    session[:return_to] = nil
  end
  
  def self.included(base)
    base.send :helper_method, :current_user, :current_user_session if base.respond_to? :helper_method
  end

end
