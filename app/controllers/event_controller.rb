# -*- coding: utf-8 -*-
class EventController < ApplicationController
  before_filter :login_required, :except => [:show, :list, :gcal]

  def new
    @event=Event.new
    @categories=cats
    if params[:event] and request.post?
      @event=Event.new(params[:event])
      @event.user=curuser
      if @event.save
        flash[:notice]="Pomyślnie dodano imprezę"
        redirect_to :action => "list"
      end
    end
  end

  def delete
    if(params[:id])
      @event = Event.find(params[:id])
      if(@event.rights?(curuser))
        if @event.delete
          flash[:notice] = "Pomyślnie usunięto imprezę"
        else
          flash[:error] = "Wystapił błąd"
        end
      else
        flash[:error] = "Nie możesz usunąć tej imprezy"
      end
    end
    redirect_to session[:prevpage]
  end

  def show
    if(params[:id])
      @event = Event.find(params[:id])
    end
  end

  def modify
    @categories=cats
    if params[:id]
      @event=Event.find(params[:id])
    else
      flash[:error]="Błąd!"
      redirect_to session[:prevpage]
      return
    end
    if params[:event] and request.post? and @event.rights?(curuser)


      @event.update_attributes(params[:event])
      if params[:event].has_key? :relation
        @event.relationdate = Date.today
      end
      if @event.save
        flash[:notice]="Pomyślnie zmodyfikowano imprezę"
        redirect_to :action => "show", :id => params[:id]
      else
        flash[:error]="Wystąpił błąd podczas edycji imprezy!"
        redirect_to :action => "list", :id => params[:id]
      end

    end
  
end

def list
  @categories=cats
    
  if params[:month] and params[:year]
      
    @events = Event.find(:all, :conditions => "month(event_start) = '#{params[:month].to_i}' AND year(event_start) = '#{params[:year].to_i}'")
  else

    if(params[:id] and params[:id]!=0.to_s)
      @user=(params[:id].nil? ? curuser : User.find(params[:id]))
      if @user
        @events = @user.events
      else
        @events = Event.find(:all)
      end
    else
      @events = Event.find(:all)
    end
    if(params[:since] and params[:since]["since(1i)"]!="" and params[:since]["since(2i)"]!="" and params[:since]["since(3i)"]!="")
      since=DateTime.new(params[:since]["since(1i)"].to_i,params[:since]["since(2i)"].to_i,params[:since]["since(3i)"].to_i,0,0,0)
    else

      since = 1.month.ago
    end
    if(params[:to] and params[:to]["to(1i)"]!="" and params[:to]["to(2i)"]!="" and params[:to]["to(3i)"]!="")
      to=DateTime.new(params[:to]["to(1i)"].to_i,params[:to]["to(2i)"].to_i,params[:to]["to(3i)"].to_i,0,0,0)

    else

      to = 1.year.from_now
    end
      
    @events.reject! { |x|  x.event_start.to_time < since}
    @events.reject! { |x|  x.event_end.to_time > to}
    @events.reject! { |x|  x.category != params[:category]} if params[:category]!= nil and params[:category]!=""

  end
  @events.sort!{|x,y| x.event_start <=> y.event_start}
end


def gcal
  respond_to do |format|

    format.js do

      render :update do |page|
        if params[:m] and params[:y]
          time = Time.parse("#{params[:y]}/#{params[:m]}/1")

          #page.visual_effect :blind_up, "calendar"
          page.replace_html "calendar", :partial => "event/calendar", :locals => {:calendar_options => calendar_options(time)}
            
          #page.insert_html :after, "mark",
          #page.visual_effect :blind_down, "calendar"
          #page.remove "mark"
        end
      end
    end
  end
    
end

 def f_unfold
    respond_to do |format|

      format.js do

        render :update do |page|


          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "event/add_file", :locals => {:event => params[:id]}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

 def r_unfold
    respond_to do |format|

      format.js do

        render :update do |page|


          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "event/add_relation", :locals => {:event => params[:id]}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end

  def fold
    respond_to do |format|

      format.js do

        render :update do |page|


          page.remove "obj"
          page.visual_effect :blind_down, "add_obj"
        end
      end
    end
  end

private
def cats
  {
    "12 godzinny wyścig" => "12 godzinny wyścig",
    "Cross Country" => "Cross Country",
    "Cross Country PL" => "Cross Country PL",
    "Enduro" => "Enduro",
    "Enduro PL" => "Enduro PL",
    "Impreza integracyjna" => "Impreza integracyjna",
    "Maraton off-road" => "Maraton off-road",
    "Motocross" => "Motocross",
    "Motocross PL" => "Motocross PL",
    "Mundial quadów" => "Mundial quadów",
    "Obóz" => "Obóz",
    "Pokazy" => "Pokazy",
    "Przeprawowa" => "Przeprawowa",
    "Rajd" => "Rajd",
    "Rekreacyjno-sportowa" => "Rekreacyjno-sportowa",
    "Sportowo-towarzyska" => "Sportowo-towarzyska",
    "Supermoto" => "Supermoto",
    "Supermoto PL" => "Supermoto PL",
    "Szkolenie" => "Szkolenie",
    "Targi i wystawy" => "Targi i wystawy",
    "Turystyczno-przeprawowa" => "Turystyczno-przeprawowa",
    "Wczasy na quadach" => "Wczasy na quadach",
    "Wczasy off-roadowe" => "Wczasy off-roadowe",
    "Wyprawa" => "Wyprawa",
    "Wyścigi" => "Wyścigi",
    "Zlot" => "Zlot"

  }
end

def calendar_options(time)
  a={}
  #a[:highlight_today]=true
  highlights=[]
  actions={}
  this_month_events=Event.find(:all,:conditions => "month(event_start) = \"#{time.strftime("%m")}\" and year(event_start) = \"#{time.strftime("%Y")}\"")
  this_month_events.each do |event|
    highlights << event.event_start.day
    actions[event.event_start.day] = link_ event.event_start.day,"event","show",event.id
  end

  a[:highlight_dates]=highlights
  a[:dates]=actions
  a
end


end
