# -*- coding: utf-8 -*-
class TeamController < ApplicationController
  before_filter :login_required
  layout "application", :except => [:iusers, :ipending_list]

  def new
    if request.post?
      @team = Team.new(params[:team])
      Teamuser.create(:user => curuser, :team => @team, :status => "owner")
      if @team.save
        Forum.create(:team => @team)
        flash[:notice]="Utworzono grupę"
        redirect_to :controller => "user", :action => "myteams"
      end
    end
  end

  def delete
    if params[:id]
      @team = Team.find(params[:id])
      links = Teamuser.find_all_by_team_id(params[:id])
      for link in links
        link.delete
      end
      @team.delete
      flash[:notice]="Pomyślnie usunięto grupę"
      redirect_to :controller => "user", :action => "myteams"
    end
  end

  def join
    if params[:id]
      @team = Team.find(params[:id])
      Teamuser.create(:user => curuser, :team => @team, :status => "pending")
      flash[:notice]="Pomyślnie wysłano prośbę o dołączenie do grupy"
      redirect_to :controller => "user", :action => "myteams"
    end
  end

  def leave
    if params[:id]
      @team = Team.find(params[:id])
      link = Teamuser.find_by_user_id_and_team_id(curuser,params[:id])
      link.delete
      @team.delete if @team.users.count==0
      flash[:notice]="Pomyślnie opuszczono grupę"
      redirect_to :controller => "user", :action => "myteams"
    end
  end

  
  def pending_list
    if params[:id]
      @team = Team.find(params[:id])
      if @team.member?(curuser)
        @pending_users = format_users(@team.pending_users)
      else
        @pending_users = []
        @rights=true
      end
    else
      @pending_users=[]
      @rights=true
    end

    if request.post? and params[:users]
      users=params[:users]
      uu=[]
      users.each_pair do |key,value|
        usr=User.find(key.gsub("u",""))
        uu << usr if value.to_i != 0
      end
      uu.each do |x|
        teamuser = Teamuser.find_by_user_id_and_team_id(x.id,@team.id)
        teamuser.status="member"
        teamuser.save
      end
      flash[:notice]="Zapisano zmiany"
      redirect_to :controller => "team", :action => "show",:id => @team.id
    elsif request.post? and !params[:users]
      flash[:error]="Nie zaznaczono użytkowników"
      redirect_to :controller => "team", :action => "pending_list",:id => @team.id
    end
  end

  def show
    if params[:id]
      @team = Team.find(params[:id])
    end

    @latest_topics = Topic.find_all_by_forum_id(@team.forum.id,:limit => 5,:order => "created_at desc")
    topics = Topic.find_all_by_forum_id(@team.forum.id)

   
    if topics.nil?
      @top_topics = nil
    else
      
      @top_topics = topics.sort do |x,y|
        y.posts.length <=> y.posts.length
      end[0..5]

    end
    
    

  end

  def modify
    if params[:id]
      @team = Team.find(params[:id])
      @team.update_attributes(params[:team])
      if request.post? and @team.save
        flash[:notice]="Zmodyfikowano grupę"
        redirect_to :controller => "user", :action => "myteams"
      end
    end
  end


  def list
    @teams = Team.find(:all)
  end


  def find
    @teams = []

    if request.post? and params[:query]
      @teams = [] #Team.find_with_ferret(params[:query])
    end
  end



  def index
    if(params[:id])
      @myteams = User.find(params[:id]).teams
    else
      @myteams = curuser.teams
    end
  end

  
  def users
    @team = Team.find(params[:id])
    @users = @team.users
  end
end
