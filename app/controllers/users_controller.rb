# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :login, :find, :ulogin, :fetch, :reset]

  def index
    @users = User.all   
    
    render :action => 'index', :layout => 'admin'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if params[:reg]
      if simple_captcha_valid?
        if @user.save_without_session_maintenance         
          @user.deliver_activation_instructions!
          phpbb = `php ../../http/forum/reg.php #{params[:user][:login]} #{params[:user][:password]} #{params[:user][:email]}`
          
          flash[:notice] = "Twoje konto zostało utworzone. Na Twój adres przesłaliśmy email z kodem potwierdzającym."
          redirect_to :controller => "site" ,:action => "index"
        else
          flash[:error] = "Nie udało się zarejestrować użytkownika, sprawdź poprawność danych i spróbuj ponownie"
          render :action => 'new'
        end
      else
        flash[:error] = "Nieprawidłowy kod z obrazka"
        render :action => 'new'
      end                
    else
      flash[:error] = "Musisz zaakceptować regulamin by korzystać z serwisu"
      render :action => 'new'
    end
  end


  def fetch
    if(params[:id])
      users = params[:id].split(":")
      users.collect!{|x| User.find(x)}
      @users = users
      tmp=[]
      while @users.length > 0
        tmp << @users[0...3]
        @users[0...3]=[]
      end
      @users= tmp

      @inject = params[:in]
    else
      nil
    end
  end

  def delete
    @user = curuser
    if @user.delete
      flash[:notice]="Usunięto użytkownika!"
      current_user_session.destroy
      redirect_to :controller => "site", :action => "index"
    else
      flash[:error]="Błąd podczas usuwania, skontaktuj się z administratorem celem usunięcia konta"
      redirect_to session[:prevpage]
    end
  end
  
  def edit
    @user = curuser
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:notice]="Pomyślnie zmodyfikowano profil"
      redirect_to :controller => "site" ,:action => "index"
    else
      flash[:error]="Nie udało się zmodyfikować profilu, sprawdź poprawność danych i spróbuj ponownie. Jeśli ten błąd będzie się powtarzał, daj nam znać" 
      render :action => 'edit'
    end
  end
  
  def find    
    case params[:by]
    when "company_id"
      @company = Company.find(params[:id])
      @users = User.find_all_by_company_id(@company.id)
      @line = "Quadomaniacy posiadający quada marki " + @company.name
    when "state_id"
      @state = State.find(params[:id])
      @users = User.find_all_by_state_id(@state.id)
      @line = "Quadomaniacy zamieszkujący województwo " + @state.name
    when "user_login"
      @users = User.active.find(:all, :conditions => "login LIKE '%#{params[:id]}%'")
    end
    
    @users = format_users @users
  end

  def show
    store_location
    @user = params[:id] ? User.find(params[:id]) : current_user

    render :action => 'show', :layout => 'user'
  end


  def friends
    if(params[:id])
      @users = User.find(params[:id]).friends
    else
      @users = curuser.friends
    end
   
  end

  def friends_index
    @friends = curuser.friends
    @requested = (curuser.ninitiator + curuser.requested_friends).uniq
    @pending = (curuser.initiator + curuser.requested_friends).uniq
  end
  def requested
    @users = (curuser.ninitiator + curuser.requested_friends).uniq
  end
  

  def pending
    @users = (curuser.initiator + curuser.requested_friends).uniq
    
  end

  def myteams
    if(params[:id])
      @teams = User.find(params[:id]).teams
    else
      @teams = curuser.teams
    end
    
  end

  def ulogin
    if request.post?
      @user = User.find_by_email(params[:user][:email])
      if @user
        @user.deliver_password_reset_instructions!
        flash[:notice] = "Wysłaliśmy właśnie do Ciebie email, postępuj zgodnie z instrukcjami"
        redirect_to root_url
      else
        flash[:error] = "Nie ma użytkownika o takim adresie!"
        
      end
    end
  end

  def reset
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error]="Niestety, nie jesteśmy w stanie zresetować hasła na tym koncie. \n
      Spróbuj skopiować adres z emaila lub zresetować hasło raz jeszcze"
    else
      if request.post?
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        if @user.save
          flash[:notice] = "Hasło zostało zmienione!"
          redirect_to :controller => :site
        else
          flash[:error] = "Błąd podczas zmiany hasła!"
        end
      else

      end
    end
  end
  
end
