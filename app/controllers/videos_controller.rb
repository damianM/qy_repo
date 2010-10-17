# -*- coding: utf-8 -*-
class VideosController < ApplicationController
  session :off, :only => :progress
  skip_before_filter :verify_authenticity_token, :only => :progress
  
  def progress
    render :update do |page|
      @status = Mongrel::Uploads.check(params[:upload_id])
      page << "UploadProgress.update(#{@status[:size]}, #{@status[:received]})" if @status
    end
  end
  
  def index
    @videos = Video.search(params[:search])
  end
  
  def create
    @video = Video.new(params[:video])

    if @video.save
      @video.convert
      flash[:notice] = 'Film został dodany'
    else
      flash[:error] = "Wystąpił problem podczas dodawania filmu"
    end
    redirect_to user_gallery_path(@video.gallery.user, @video.gallery)
  end
  
  def show
    store_location

    @video = Video.find(params[:id])
    @video.increase_display_counter if @video.gallery.user != current_user
  end

  def vote
    @video = Video.find(params[:id])

    @rate = Rate.new(params[:rate])
    @rate.rateatable = @video
    @rate.user = current_user

    if @rate.save
      flash[:notice] = "Głos został zapisany"
    else
      flash[:error] = "Głos nie został zapisany" + @rate.errors.inspect
    end

    redirect_to video_path(@video)
  end
  
  def destroy
    @video = Video.find(params[:id])

    if @video.gallery.rights?(current_user)
      @video.destroy
      flash[:notice]="Pomyślnie usunięto film"
    else
      flash[:error]="Napotkano błąd"
    end
    redirect_to user_gallery_path(@video.gallery.user, @video.gallery)
  end

  def edit
    @video = Video.find(params[:id])
    return redirect_to root_path unless @video.rights? current_user
  end

  def update
    @video = Video.find(params[:id])
    return redirect_to root_path unless @video.rights? current_user

    if @video.update_attributes(params[:video])
      flash[:notice] = "Pomyślnie zmodyfikowano film"
    else
      flash[:error] = "Wystąpił błąd podczas edycji filmu"
    end

    redirect_to user_gallery_path(@video.gallery.user, @video.gallery)
  end
  
  def search
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

    unless params[:user].nil?
      user = User.find_by_login(params[:user])
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