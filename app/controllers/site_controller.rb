class SiteController < ApplicationController

  filter_access_to :all
  
  def index
    @latest_videos = Video.find(:all,:limit => 7, :order => "created_at desc").reject{|x| x.gallery.user.nil?}
    @top_video = Video.find(:first, :order => "counter desc")
       
    if current_user
      @latest_friends = current_user.friends.find(:all, :limit => 4, :order => 'created_at DESC')
      @latest_friends_photos = current_user.friends.collect{|friend| friend.galleries}.flatten.collect{|gallery| gallery.photos}.flatten.sort{|a,b| a.created_at <=> b.created_at}[0..3]
      @latest_friends_videos = current_user.friends.collect{|friend| friend.galleries}.flatten.collect{|gallery| gallery.videos}.flatten.sort{|a,b| a.created_at <=> b.created_at}[0..6]
    end
    
    @events = Event.find(:all,:limit => 2, :order => "relationdate desc")
    @latest_events = Event.find(:all,:limit => 2, :order => "relationdate desc", :conditions => "relationdate IS NOT NULL")    
  end

  def help
  end

  def about
  end

  def ppolicy
  end

  def terms
    
  end

end
