# -*- coding: utf-8 -*-
class MessageController < ApplicationController
  before_filter :login_required

  def index
    
    @sender = curuser
    @marks||=0
    @received = curuser.received
    @sent = curuser.sent

    if params[:commit]=="Zaznacz wszystkie"
      @marks=1
    elsif params[:commit]=="Odznacz wszystkie"
      @marks=0
    end

    @mark||=0
    @received = curuser.received

    if params[:commit]=="Oznacz jako nieprzeczytane"

      p=get_messages params

      p.each do |msg|
        msg.read=0
        msg.save!
      end
    elsif params[:commit]=="Oznacz jako przeczytane"
      p=get_messages params

      p.each do |msg|
        msg.read=1
        msg.save!

      end
    elsif params[:commit]=="Usuń"
      p=get_messages params

      p.each do |msg|
        msg.details.trash
      end
    elsif params[:commit]=="Zaznacz wszystkie"
      @mark=1
    elsif params[:commit]=="Odznacz wszystkie"
      @mark=0
    end
  end

  def new
    @receiver = User.find(params[:id])
    @sender = curuser
    if request.post? and params[:message]
      @message = Message.new(params[:message])
      @message.sender = @sender
      @message.receiver = @receiver
      @message.read = 0
      (@message.details=MessageDetails.new(:details => 0)).save!
      if @message.save
        UserMailer.deliver_new_message(@receiver,@sender)
        flash[:notice]="Wiadomość została wysłana"
        redirect_to :controller => "message", :action => "sent"
      else
        flash[:error]="Wystąpił błąd!"
      end
    end
  end

  def newr
    @sender = curuser
    if request.post? and params[:message]
      if(params[:message][:user].nil? or params[:message][:user]=="")
        flash[:error]="Wybierz użytkownika"
        redirect_to session[:prevpage]
      end
      @receiver=User.find_by_login(params[:message][:user])
      params[:message].delete :user
      @message = Message.new(params[:message])
      @message.sender = @sender
      @message.receiver = @receiver
      @message.read = 0
      (@message.details=MessageDetails.new(:details => 0)).save!
      if @message.save
        UserMailer.deliver_new_message(@receiver,@sender)
        flash[:notice]="Wiadomość została wysłana"
        redirect_to :controller => "message", :action => "sent"
      end
    end
  end

  def sent
    @mark||=0
    @sent = curuser.sent
    if params[:commit]=="Usuń"
      p=get_messages params

      p.each do |msg|
        msg.details.send_trash
      end
    elsif params[:commit]=="Zaznacz wszystkie"
      @mark=1
    elsif params[:commit]=="Odznacz wszystkie"
      @mark=0
    end
  end

  def received
    @mark||=0
    @received = curuser.received
    
    if params[:commit]=="Oznacz jako nieprzeczytane"

      p=get_messages params
      
      p.each do |msg|
        msg.read=0
        msg.save!
      end
    elsif params[:commit]=="Oznacz jako przeczytane"
      p=get_messages params

      p.each do |msg|
        msg.read=1
        msg.save!
        
      end
    elsif params[:commit]=="Usuń"
      p=get_messages params

      p.each do |msg|
        msg.details.trash
      end
    elsif params[:commit]=="Zaznacz wszystkie"
      @mark=1
    elsif params[:commit]=="Odznacz wszystkie"
      @mark=0
    end
  end
  def reply


    @message = Message.find(params[:id])
    @receiver = @message.sender
    @sender = @message.receiver
    @message.content=nil
    @message.title = "Re: "+ @message.title
    if request.post? and params[:message]
      @message = Message.new(params[:message])
      @message.sender = @sender
      @message.receiver = @receiver
      @message.read = 0
      (@message.details=MessageDetails.new(:details => 0)).save!
      if @message.save
        flash[:notice]="Wiadomość została wysłana"
        redirect_to :controller => "message", :action => "sent"
      end
    end
  end

  def show
    @user = curuser
    
    @message = Message.find(params[:id])
    if @message.receiver== @user
      @message.update_attribute("read", 1)
      @message.save
    end
  end


  def get_messages params
    p=[]
    params.each_pair do |k,v|
      if k.to_i != 0
        p << Message.find(k.to_i)
      end
    end
    p
  end

  def del
    @msg = Message.find(params[:id])
    if @msg.receiver==curuser
      @msg.details.trash
    else
      flash[:error] = "Usuwanie wiadomości nie powiodło się"
    end
    redirect_to session[:prevpage]
  end

  def sdel
    @msg = Message.find(params[:id])
    if @msg.sender==curuser
      @msg.details.send_trash
    else
      flash[:error] = "Usuwanie wiadomości nie powiodło się"
    end
    redirect_to session[:prevpage]
  end
end
