# -*- coding: utf-8 -*-
class PhotoController < ApplicationController
  before_filter :login_required

  def new
  end

  def main
    if  params[:id]
      @photo = Photo.find(params[:id])
      user = curuser
      user.update_attribute("photo", @photo)
      if !@photo.nil?
        flash[:notice]="Pomyślnie ustawiono zdjęcie"
      else
        flash[:error]="Problem podczas ustawiania zdjęcia"
      end

    end
    redirect_to session[:prevpage]
  end

  def delete
    @photo=Photo.find(params[:id])
    @gallery=@photo.gallery
    if @gallery.rights?(curuser)
      @photo.remove
      @photo.delete
      flash[:notice]="Pomyślnie usunięto zdjęcie"
    else
      flash[:error]="Napotkano błąd"
    end
    redirect_to :controller => "gallery", :action =>"index", :id => @gallery.id
  end

  def show
    @photo=Photo.find(params[:id])
    if @photo.user!=curuser
      @photo.counter+=1
      @photo.save
    end
    @gallery = @photo.gallery
    photos = @gallery.photos + (@gallery.videos.nil? ? [] : @gallery.videos)
    ind=-1
    photos.each_with_index{|x,indx| ind=indx if x==@photo }
    @prev = ind>0 ? photos[ind-1] : nil
    @nxt = ind<photos.length-1 ? photos[ind+1] : nil
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
