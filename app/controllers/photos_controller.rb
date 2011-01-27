# -*- coding: utf-8 -*-
class PhotosController < ApplicationController
  before_filter :login_required

  def list
    store_location

    @photos = Photo.find(:all, :conditions => [ "parent_id IS NULL" ])
    render :action => 'list', :layout => 'admin'
  end
  
  def index
    params[:per_page] ||= 30
    @photos = Photo.paginate(:page => params[:page], :per_page => params[:per_page], :conditions => [ "parent_id IS NULL" ])
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Zdjęcie zostało dodane"
    else
      flash[:error] = "Wystąpił problem podczas dodawania zdjęcia"
    end
    
    if params[:mark_as_main_photo]
      user = curuser
      user.update_attribute(:photo_id, @photo.id)
    end

    @photo.gallery.thumbnail = GalleryThumbnail.regenerate!(@photo.gallery.id)
    @photo.gallery.save

    redirect_back_or_default(root_path)
  end
  
  def show
    store_location

    @photo = Photo.find(params[:id])
    @gallery = @photo.gallery
    @galleriable = @gallery.galleriable

    @photo.increase_display_counter if @galleriable != current_user

    params[:per_page] ||= 1

    photos = @gallery.photos.find(:all, :conditions => ["id != ?", @photo.id])
    photos.unshift(@photo)
    @photos = photos.paginate(:page => params[:page], :per_page => params[:per_page])
  end

  def main
    @photo = Photo.find(params[:id])

    if current_user.update_attribute(:photo_id, @photo.id)
      flash[:notice]="Pomyślnie ustawiono zdjęcie"
    else
      flash[:error]="Problem podczas ustawiania zdjęcia"
    end
    redirect_to photo_path(@photo)
  end

  def vote
    @photo = Photo.find(params[:id])
    
    @rate = Rate.new(params[:rate])
    @rate.rateatable = @photo
    @rate.user = current_user

    if @rate.save
      flash[:notice] = "Głos został zapisany"
    else
      flash[:error] = "Głos nie został zapisany" + @rate.errors.inspect
    end

    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.gallery.rights?(current_user)
      @photo.destroy
      flash[:notice]="Pomyślnie usunięto zdjęcie"
    else
      flash[:error]="Napotkano błąd"
    end
    
    @photo.gallery.thumbnail = GalleryThumbnail.regenerate!(@photo.gallery.id)
    @photo.gallery.save

    redirect_back_or_default('/')
  end

  def edit
    @photo = Photo.find(params[:id])
    return redirect_to root_path unless @photo.rights? current_user
  end
  
  
  def update
    @photo = Photo.find(params[:id])
    return redirect_to root_path unless @photo.rights? current_user

    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Pomyślnie zmodyfikowano zdjęcie"
    else
      flash[:error] = "Wystąpił błąd podczas edycji zdjęcia"
    end
    
    redirect_back_or_default('/')
  end

  def rate
    @photo = Photo.find(params[:id])
    
    @photo.rates.build({:user_id => current_user.id, :value => params[:value]})

    if @photo.save
      render :json => {
        :success => true,
        :object_id => @photo.id,
        :content => render_to_string( :partial => 'rating', :locals => { :rated_object => @photo }),
        :message => "Głos został oddany."
      }
    else
      render :json => { :success => false, :message => "Próba oddania głosu nie powiodła się." }
    end
  end

end
