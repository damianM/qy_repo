# -*- coding: utf-8 -*-
class GalleriesController < ApplicationController
  before_filter :login_required
  
  def index
    if params[:user_id]
      @galleriable = User.find(params[:user_id])
    elsif params[:event_id]
      @galleriable = Event.find(params[:event_id])
    else
      @galleriable = current_user
    end
      
    @galleries = @galleriable.galleries
  end

  def new
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.build
  end

  def create
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])

    @gallery = Gallery.new(params[:gallery])
    @gallery.galleriable = @galleriable

    if @gallery.save
      flash[:notice] = "Dodano galerię"
      redirect_to eval("#{@galleriable.is_a?(User) ? 'user' : 'event'}_galleries_path(@galleriable)") 
    else
      flash[:error] = "Galeria nie została dodana"
      render :action => "new"
    end
  end
  
  def edit
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id])
  end
 
  def update
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id])

    return redirect_to root_path unless @gallery.rights? current_user

    if @gallery.update_attributes(params[:gallery])
      flash[:notice] = "Pomyślnie zmodyfikowano galerię"
      redirect_to eval("#{@galleriable.is_a?(User) ? 'user' : 'event'}_galleries_path(@galleriable)")
    else
      flash[:error] = "Wystąpił błąd podczas edycji galerii"
      render :action => 'edit'
    end
  end
  
  def destroy
    @galleriable = params[:user_id].nil? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id])

    @gallery.delete
    flash[:notice]="Pomyślnie usunięto galerię"
    redirect_to eval("#{@galleriable.is_a?(User) ? 'user' : 'event'}_galleries_path(@galleriable)")
  end

  def show
    store_location

    @galleriable = params[:user_id].blank? ? Event.find(params[:event_id]) : User.find(params[:user_id])
    @gallery = @galleriable.galleries.find(params[:id].to_i, :include => [ :photos, :videos ])
  end

end
