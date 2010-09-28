# -*- coding: utf-8 -*-
class UserController < ApplicationController
  before_filter :protect, :except => [:register, :login, :find, :ulogin, :fetch, :reset]

  def register
    if request.post? and params[:user]
      qq={}
      qq[:company]=params[:user][:company].clone
      qq[:qtype]=params[:user][:qtype].clone
      qq[:description]=params[:user][:description].clone
      params[:user].delete :company
      params[:user].delete :qtype
      params[:user].delete :description
      @user = User.new(params[:user])
      if params[:reg]
        if simple_captcha_valid?
          if(!qq[:company].nil? and qq[:company]!="")
            @quad = Quad.new(qq)
            @quad.user=@user
            @quad.save!
          end
          if @user.save_without_session_maintenance
             @user.deliver_activation_instructions!
             phpbb = `php ../../http/forum/reg.php #{params[:user][:login]} #{params[:user][:password]} #{params[:user][:email]}`
            
            flash[:notice]="Twoje konto zostało utworzone. Na Twój adres przesłaliśmy email z kodem potwierdzającym."
            redirect_to :controller => "site" ,:action => "index"
          else
            flash[:error]="Nie udało się zarejestrować użytkownika, sprawdź poprawność danych i spróbuj ponownie"
          end
        else
          flash[:error]="Nieprawidłowy kod z obrazka"
        end

        
      else
        flash[:error]="Musisz zaakceptować regulamin by korzystać z serwisu"
      end
      @user.password=nil
      @user.password_confirmation=nil
      class <<@user
        attr_accessor :company,:qtype,:description
      end
      @user.company=qq[:company]
      @user.qtype=qq[:qtype]
      @user.description=qq[:description]
    else
      
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

  def modify
    @user = curuser
    @quad = @user.quad
    @quad ||= @user.build_quad
    if request.post? and params[:user]
      @user.update_attributes(params[:user])
      
      if @user.save
        if params[:company]
          @quad.company=params[:company]
          @quad.qtype=params[:qtype]
          @quad.description=params[:description]
        end
        if @user.quads[0]!=nil and @quad.company.nil?
          @quad.delete!
        elsif @user.quads[0].nil? and @quad.company!=nil
          @quad.user = curuser
          @quad.save
        elsif @user.quads[0]!=nil and @quad.company!=nil
          @quad.save
        end
        

        flash[:notice]="Pomyślnie zmodyfikowano profil"
        redirect_to :controller => "site" ,:action => "index"
      else

        flash[:error]="Nie udało się zmodyfikować profilu, sprawdź poprawność danych i spróbuj ponownie. Jeśli ten błąd będzie się powtarzał, daj nam znać" 
      end
    else
      
    end
  end


  def find
    
    unless(params[:id].nil?)

      case params[:by]
      when "quad"
        quads = Quad.find_all_by_company params[:id].gsub("--", "/")
        usrs = quads.collect{|x| x.user}
        @users = usrs.uniq
        @line = "Quadomaniacy posiadający quada marki "+params[:id].gsub("--", "/")
      when "region"
        @users = User.find_all_by_region(params[:id])
        @line = "Quadomaniacy zamieszkujący województwo "+params[:id]
      when "aaf"
        @users = [] #User.find_with_ferret(params[:id])
        
      end
    end
    @protect = curuser ? false : true
    @users = format_users @users
  end

  def show
    if params[:id] and params[:id] != "0"
      @user = User.find(params[:id])
    else
      @user = curuser
    end
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


