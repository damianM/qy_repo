# -*- coding: utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  after_filter :savepage, :dis_flash
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery  :secret => '983f0b7beab8f189a2bc4491de9a8089'
  include SimpleCaptcha::ControllerHelpers
  #include SslRequirement
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user


  def savepage
    session[:prevpage]=request.request_uri
  end

  def curuser
    current_user
  end

  def dis_flash

  end
  
  def lt(time)
    return "" if time.nil?
    l time, :format=> "%d.%m.%Y, %H:%M"
  end
  def ltd(time)
    return "" if time.nil?
    l time, :format=> "%d.%m.%Y"
  end

  def protect
    unless curuser
      session[:ppage]=request.request_uri
      flash[:error]="Dostęp do tej części strony wymaga zalogowania"
      redirect_to :controller => "user_sessions", :action => "new"
      return false
    end
  end

  def format_galleries user
    gg=user.galleries.sort{|x,y| x.created_at <=> y.created_at}
    g=[]
    gg.each_with_index{|x,indx| g << [x,indx]}
    g
  end
  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user

    return @current_user if defined?(@current_user)

    @current_user = current_user_session && current_user_session.user

  end
  def format_users(users)

      tmp=[]
      while users.length > 0
        tmp << users[0...2]
        users[0...2]=[]
      end
      return tmp
  end
end
