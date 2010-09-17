# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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

  def link_find(text,id, by)
    link_to text, :controller => "user", :action => "find",:id => id.gsub("/","--"), :by => by
  end

  def link_file(name,link)
    "<a href='#{link}' class='link' title='Pobierz'>#{name}</a>"
  end

  def logged_in?
    curuser
  end

  def curuser
    current_user
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

  def regions
    regions={}
    regs=["dolnośląskie", "małopolskie", "mazowieckie", "kujawsko-pomorskie","lubelskie","lubuskie","łódzkie","opolskie","podkarpackie",
      "podlaskie","pomorskie","śląskie","świętokrzyskie","warmińsko-mazurskie","wielkopolskie","zachodniopomorskie"]
    regs.each do |x|
      usrs = User.find_all_by_region(x)
      regions[x]= usrs.length
    end
    
    regions
  end

  def quads
    quads={}
    qs=["Bombardier/Can-am","Cectek","CF Moto", "Honda", "Kawasaki","KTM","Kymco", "Linhai", "Lucky Star", "Polaris", "Suzuki", "Yamaha", "Side by Side","Inne"]
    qs.each do |x|
      q = Quad.find_all_by_company(x)
      q.collect! {|y| y.user}
      quads[x]= q.uniq.length
    end
    
    quads
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
      actions[event.event_start.day] = link_ event.event_start.day,"event","show",event.id
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

  def format_galleries user
    gg=user.galleries.sort{|x,y| x.created_at <=> y.created_at}
    g=[]
    gg.each_with_index{|x,indx| g << [x,indx]}
    g
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



  def insert_corners a=false

  end
  def insert_bcorners

  end



  def s_top_videos
    Video.find(:all, :order => "counter desc",:conditions => "description IS NOT NULL ", :limit => 10).reject{|x| x.gallery.user.nil?}
  end

  def s_latest_users
    User.find(:all,:limit => 4, :order => "created_at desc")
  end

  def s_latest_photos
    Photo.find(:all,:limit => 10, :order => "created_at desc").reject{|x| x.gallery.user.nil?}[0...6]
  end
end

