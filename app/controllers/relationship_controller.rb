# -*- coding: utf-8 -*-
class RelationshipController < ApplicationController
  before_filter :login_required

  def req
    
    if(params[:id])
      @user = curuser
      @friend = User.find(params[:id])
      @relationship = Relationship.find_by_user_id_and_friend_id(@user,@friend)
      unless @relationship
        Relationship.req(@user, @friend)

        Message.send_invitation(@user,@friend)
        
        flash[:notice] = "Wysłano zaproszenie"
        redirect_to :controller => "users", :action => "pending"
      else
        Relationship.accept(@user, @friend)
        flash[:notice] = "Dodano użytkownika do znajomych"
        redirect_to :controller => "users", :action => "friends", :id => @user.id
      end
      
    end
  end
  def accept
    if(params[:id])
      @user = curuser
      @friend = User.find(params[:id])
      @relationship = Relationship.find_by_user_id_and_friend_id(@user,@friend)
      if @relationship.accepted?
        flash[:notice] = "Użytkownik #{@friend.login} dołączył do Twojej listy znajomych #{ltd @relationship.created_at}"
      else
        Relationship.accept(@user, @friend)
        flash[:notice] = "Dodano użytkownika do znajomych"
      end
      
      redirect_to :controller => "users", :action => "friends", :id => @user.id
    end
  end

  def delete
    if(params[:id])
      @user = curuser
      @friend = User.find(params[:id])
      Relationship.delete(@user, @friend)
      flash[:notice] = "Usunięto znajomość"
      redirect_to :controller => "users", :action => "friends", :id => @user.id
    end
  end

end
