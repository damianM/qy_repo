# -*- coding: utf-8 -*-
class PhotosController < ApplicationController
  before_filter :login_required

  def index
    render :text => 'index'
  end

  def new
    @allow_main_photo = false

    @user = User.find(params[:user_id])
    @gallery = @user.galleries.find(params[:gallery_id])
    @photo = @gallery.photos.build
  end

  def create
    @user = User.find(params[:user_id])
    @gallery = @user.galleries.find(params[:gallery_id])
    @photo = @gallery.photos.build(params[:photo])

    if @photo.save
      flash[:notice] = "Zdjęcie zostało dodane"
      redirect_to user_gallery_path(@user, @gallery)
    else
      flash[:error] = "Wystąpił problem podczas dodawania zdjęcia"
      render :action => 'new'
    end
    
    #if params[:mark_as_main_photo]
    # user = curuser
    # user.update_attribute("photo", @photo)
    #   user.save
    #end
  end
  
  def show
    store_location

    @user = User.find(params[:user_id])
    @gallery = @user.galleries.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])

    @photo.increase_display_counter if @gallery.user != current_user

    params[:per_page] ||= 1

    photos = @gallery.photos.find(:all, :conditions => ["id != ?", @photo.id])
    photos.unshift(@photo)
    @photos = photos.paginate(:page => params[:page], :per_page => params[:per_page])
  end

  def main
    @user = User.find(params[:user_id])
    @gallery = @user.galleries.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])

    if @user.update_attribute(:photo_id, @photo.id)
      flash[:notice]="Pomyślnie ustawiono zdjęcie"
    else
      flash[:error]="Problem podczas ustawiania zdjęcia"
    end
    redirect_to user_gallery_photo_path(@user, @gallery, @photo)
  end

  def vote
    @user = User.find(params[:user_id])
    @gallery = @user.galleries.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])
    
    @rate = Rate.new(params[:rate])
    @rate.rateatable = @photo
    @rate.user = current_user

    if @rate.save
      flash[:notice] = "Głos został zapisany"
    else
      flash[:error] = "Głos nie został zapisany" + @rate.errors.inspect
    end

    redirect_to user_gallery_photo_path(@user, @gallery, @photo)
  end
  
  def p_edit
    respond_to do |format|

      format.js do

        render :update do |page|
          
          #page.hide "add_obj"
          page.visual_effect :blind_up, "add_obj"
          page.insert_html :after, "add_obj", :partial => "edit_photo", :locals => {:photo => params[:id], :cname => Photo.find(params[:id]).description}
          page.hide "obj"
          page.visual_effect :blind_down, "obj"
        end
      end
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @gallery = @user.galleries.find(params[:gallery_id])
    @photo = @gallery.photos.find(params[:id])

    if @gallery.rights?(current_user)
      @photo.destroy
      flash[:notice]="Pomyślnie usunięto zdjęcie"
    else
      flash[:error]="Napotkano błąd"
    end
    redirect_to user_gallery_path(@user, @gallery)
  end

  def edit
    if request.post? and params[:id]
      photo = Photo.find(params[:id])
      if(photo.rights? curuser)
        photo.update_attributes(params[:photo])
        if photo.save
          flash[:notice] = "Pomyślnie zmodyfikowano zdjęcie"
        else
          flash[:error] = "Wystąpił błąd podczas edycji zdjęcia"
        end
      else
        flash[:error] = "Nie możesz edytować tego zdjęcia"
      end
    end
    redirect_to :controller => "gallery", :action => "index", :id => photo.gallery.id
  end

end
