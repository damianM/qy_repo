# -*- coding: utf-8 -*-
class VideosController < ApplicationController
  upload_status_for  :new
  layout "application", :except => [:ifind, :idfind]

  def new
  end

  def create
      v=params[:video].clone
      params[:video].delete(:file)
      if !v[:file] or v[:file].content_type !~ /video/
        flash[:error]="Nieprawidłowy typ pliku"
        redirect_to session[:prevpage]
      else
        @video=Video.new(params[:video])
        vr=Vrate.new
        vr.video_id=@video
        vr.sum=0
        vr.votes=0
        vr.save!
        @video.vrate=vr
        @video.views=0
        @video.gallery=Gallery.find(params[:id])
        c=@video.convert(v[:file],curuser)
        @video.counter=0
        if c and @video.save
          flash[:notice]="Pomyślnie dodano wideo"
        else
          flash[:error]="Wystąpił błąd"
        end

        #render :text => %(UPLOADED: #{params.inspect}.<script type="text/javascript">window.parent.UploadProgress.finish();</script>)
        redirect_to :controller => "gallery", :action => "index", :id => params[:id]
      end
  end
  
  def edit
  end

  def update
  end

  def delete
    @video=Video.find(params[:id])
    @gallery=@video.gallery
    if @gallery.rights?(curuser)
      @video.remove
      @video.delete
      flash[:notice]="Pomyślnie usunięto wideo"
    else
      flash[:error]="Napotkano błąd"
    end
    redirect_to :controller => "gallery", :action =>"index", :id => @gallery.id
  end

  def show
    @video=Video.find(params[:id])
    @gallery = @video.gallery
    if @gallery.user!=curuser
      @video.counter+=1
      @video.save
    end
    photos = @gallery.photos + (@gallery.videos.nil? ? [] : @gallery.videos)
    ind=-1
    photos.each_with_index{|x,indx| ind=indx if x==@video }
    @prev = ind>0 ? photos[ind-1] : nil
    @nxt = ind<photos.length-1 ? photos[ind+1] : nil
  end

  def edit
    if request.post? and params[:id]
      video = Video.find(params[:id])
      if(video.rights? curuser)
        video.update_attributes(params[:video])
        if video.save
          flash[:notice] = "Pomyślnie zmodyfikowano film"
        else
          flash[:error] = "Wystąpił błąd podczas edycji filmu"
        end
      else
        flash[:error] = "Nie możesz edytować tego filmu"
      end
    end
    redirect_to :controller => "gallery", :action => "index", :id => video.gallery.id
  end


  def find
    unless(params[:id].nil?)
      @videos = Video.find_with_ferret(params[:id])
    end
    @videos
  end

  
  def dfind
    puts params.inspect
    if(params[:since] and params[:since]["since(1i)"]!="" and params[:since]["since(2i)"]!="" and params[:since]["since(3i)"]!="")
      since=Time.mktime(params[:since]["since(1i)"].to_i,params[:since]["since(2i)"].to_i,params[:since]["since(3i)"].to_i,0,0,0)
    else
      since = 6.months.ago
    end
    if(params[:to] and params[:to]["to(1i)"]!="" and params[:to]["to(2i)"]!="" and params[:to]["to(3i)"]!="")
      to=Time.mktime(params[:to]["to(1i)"].to_i,params[:to]["to(2i)"].to_i,params[:to]["to(3i)"].to_i,23,59,59)
    else
      to = 1.year.from_now
    end
    user = nil
    if(params[:user] and params[:user][:user]!="")
      user = User.find_by_login(params[:user][:user])
    end

    @videos = Video.find(:all)
    @videos.reject! { |x|  x.created_at < since}

    @videos.reject! { |x|  x.created_at > to}
    @videos.reject!{|x| x.gallery.user != user} if user
    if params[:marks]
      @videos.sort!{|x,y| (params[:marks]=="desc" ? -1 : 1)*
        (
          (x.vrate.votes==0 ? 0 : (x.vrate.sum.to_f / x.vrate.votes).round(2)) <=> (y.vrate.votes==0 ? 0 : ((y.vrate.sum.to_f / y.vrate.votes).round(2)))) }
        
    elsif params[:views]
@videos.sort!{|x,y| (params[:views]=="desc" ? -1 : 1)*(x.counter<=>y.counter) }
    end
    params.delete :marks if params[:marks]
    params.delete :views if params[:views]
    @videos
  end
end
