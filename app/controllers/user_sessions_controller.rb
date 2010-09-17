class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Poprawnie zalogowano!"
      if session[:ppage]
        ss=session[:ppage]
        session[:ppage]=nil
        redirect_to ss
      else

        redirect_to :controller => "site" ,:action => "index"
      end
    else

            flash[:error]="Nieprawidłowe dane, spróbuj ponownie"
      render :action => :new
    end
    
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Poprawnie wylogowano!"
    redirect_to :controller => "site" ,:action => "index"
  end
end