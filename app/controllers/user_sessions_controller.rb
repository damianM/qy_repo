# -*- coding: utf-8 -*-
class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Poprawnie zalogowano!"
      redirect_back_or_default(root_url)
    else
      flash[:error] = "Nieprawidłowe dane, spróbuj ponownie"
      render :action => :new
    end
  end
  
  def destroy  
    @user_session = UserSession.find  
    @user_session.destroy
    session[:return_to] = nil
    flash[:notice] = "Poprawnie wylogowano!"
    redirect_to root_url  
  end
 
end
