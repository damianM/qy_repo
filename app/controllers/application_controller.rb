# -*- coding: utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => '983f0b7beab8f189a2bc4491de9a8089'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  filter_parameter_logging :password, :password_confirmation

  include AuthenticatedSystem
  include SimpleCaptcha::ControllerHelpers

  def lt(time)
    return "" if time.nil?
    l time, :format=> "%d.%m.%Y, %H:%M"
  end

  def ltd(time)
    return "" if time.nil?
    l time, :format=> "%d.%m.%Y"
  end

  def protect
    login_required
  end

  def format_galleries user
    gg=user.galleries.sort{|x,y| x.created_at <=> y.created_at}
    g=[]
    gg.each_with_index{|x,indx| g << [x,indx]}
    g
  end
 
  private

  def format_users(users)
    tmp=[]
    while users.length > 0
      tmp << users[0...2]
      users[0...2]=[]
    end
    return tmp
  end

end
