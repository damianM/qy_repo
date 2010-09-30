class SiteController < ApplicationController

  filter_access_to :all
  
  def index
    
    @latest_videos=Video.find(:all,:limit => 7, :order => "created_at desc").reject{|x| x.gallery.user.nil?}
    
    @top_video = Video.find(:first, :order => "counter desc")

    if curuser
    @clatest_photos=Photo.find(:all,:limit => 7, :conditions =>
        "gallery_id in
(select id from galleries where user_id in
  (select friend_id from relationships where status='accepted' and user_id=#{curuser.id})
)",
      :order => "created_at desc").reject{|x| x.gallery.user.nil?}
    @clatest_videos=Video.find(:all,:limit => 4, :conditions =>
        "gallery_id in
(select id from galleries where user_id in
  (select friend_id from relationships where status='accepted' and user_id=#{curuser.id})
)",
      :order => "created_at desc").reject{|x| x.gallery.user.nil?}
    end
    
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
