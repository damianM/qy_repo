# -*- coding: utf-8 -*-
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def form_authenticity_token_tag
    javascript_tag("var AUTH_TOKEN = '#{form_authenticity_token}';") if protect_against_forgery?
  end

  def link_ (text, controller, action, id=nil, confirm=nil)
    if id.nil?
      if confirm.nil?
        link_to text, :controller => controller, :action => action
      else
        link_to text, {:controller => controller, :action => action}, :confirm => confirm
      end
    else
      if confirm.nil?
        link_to text, :controller => controller, :action => action, :id=>id
      else
        link_to text, {:controller => controller, :action => action, :id=>id}, :confirm => confirm
      end
    end
  end

  def link_o (text, controller, action, id=nil, confirm=nil)
    if id.nil?
      if confirm.nil?
        link_to text, {:controller => controller, :action => action}, :class => "opt"
      else
        link_to text, {:controller => controller, :action => action}, :confirm => confirm, :class => "opt"
      end
    else
      if confirm.nil?
        link_to text, {:controller => controller, :action => action, :id=>id},  :class => "opt"
      else
        link_to text, {:controller => controller, :action => action, :id=>id}, :confirm => confirm, :class => "opt"
      end
    end
  end

  def link_file(name,link)
    "<a href='#{link}' class='link' title='Pobierz'>#{name}</a>"
  end

  def received_messages
    user = curuser
    user.sent
  end

  def lt(time)
    return "" if time.nil?
    l time, :format=> "%d.%m.%Y, %H:%M"
  end

  def ltd(time)
    return "" if time.nil?
    l time, :format=> "%d.%m.%Y"
  end

  def ltdiff(time)
    return "" if time.nil?
    years = ((Time.now - time.to_datetime).year - Time.at(0).year).to_i
    years.to_s + ((years%10 >= 2 and years%10 <= 4 ) ? " lata" :  " lat")
    #time.to_datetime.class
  end

  def img(photo,options=nil)    
    if options
      photo.nil? ? image_tag("/anon.png",options) : image_tag(photo.thumb,options)
    else
      photo.nil? ? image_tag("/anon.png") : image_tag(photo.thumb)
    end
  end

  def img80(photo,options=nil)
    if options
      photo.nil? ? image_tag("/80_anon.png",options) : image_tag(photo.thumb80,options)
    else
      photo.nil? ? image_tag("/80_anon.png") : image_tag(photo.thumb80)
    end
  end

  def incoming_events
    Event.find(:all, :conditions => "event_start < #{Time.now.to_i}", :limit => 10)
  end

  def trunc a,b=50
    if a.length > b
      a[0...b] + " ..."
    else
      a
    end
  end

  alias :cut :trunc

  def calendar_options(time=Time.now)
    a={}
    #a[:highlight_today]=true
    highlights=[]
    actions={}
    a[:year] = time.year
    a[:month] = time.month
    this_month_events=Event.find(:all,:conditions => "month(event_start) = \"#{time.strftime("%m")}\" and year(event_start) = \"#{time.strftime("%Y")}\"")
    this_month_events.each do |event|
      highlights << event.event_start.day
      actions[event.event_start.day] = link_to event.event_start.day, event_path(event)
    end

    a[:highlight_dates]=highlights
    a[:dates]=actions
    a
  end

  def agree(user)
    if curuser==user or user.friends(curuser)
      true
    else
      false
    end
  end

  def ntobr t
    t.nil? ? "" : (t.gsub /\n/,"<br/>")
  end

  def lbr t
    t.gsub!(/(\S{20,})(\S+)/,"#{$1}&#8203;#{$2}")
    t
  end

  def iframe_styles
    stylesheet_link_tag("style") +
      "<style type=\"text/css\">
  body{
    background: #ffefdb;
    font-family: Verdana,Arial,sans-serif;
  }
</style>"
  end

  def insert_bcorners
  end
  
  def s_top_videos
    Video.find(:all, :order => "counter desc",:conditions => "description IS NOT NULL ", :limit => 10).reject{|x| x.gallery.user.nil?}
  end
  
  def tf_in_pl value
    return 'Tak' if value
    return 'Nie'
  end

  def yes_no_for_select
    [['tak',true],['nie',false]]
  end
  
end

