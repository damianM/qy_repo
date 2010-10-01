# -*- coding: utf-8 -*-
class BannersController < ApplicationController

  layout 'admin'
  
  def index
    @banners = Banner.all
  end
  
  def new
    @banner = Banner.new
    @banner.serial = Banner.generate_serial
  end

  def create
    @banner = Banner.new(params[:banner])

    if @banner.save
      flash[:notice] = "Reklama zostało dodana."

      redirect_to banners_path
    else
      flash[:error]  = "Próba utworzenia reklamy nie powiodła się."
      render :action => 'new'
    end
  end
  
  def show
    @banner = Banner.find(params[:id])
  end
  
  def edit
    @banner = Banner.find(params[:id])
    @banner.serial = Banner.generate_serial
  end

  def update
    @banner = Banner.find(params[:id])

    if @banner.update_attributes(params[:banner])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to banners_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit'
    end
  end


end
