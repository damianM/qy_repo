# -*- coding: utf-8 -*-
class AdsController < ApplicationController

  layout 'admin'
  
  def index
    @ad = Ad.all
  end
  
  def new
    @ad = Ad.new
    @ad.serial = Ad.generate_serial
  end

  def create
    @ad = Ad.new(params[:ad])

    if @ad.save
      flash[:notice] = "Ogłoszenie zostało dodana."

      redirect_to ads_path
    else
      flash[:error]  = "Próba utworzenia ogłoszenia nie powiodła się."
      render :action => 'new'
    end
  end
  
  def show
    @ad = Ad.find(params[:id])
  end
  
  def edit
    @ad = Ad.find(params[:id])
    @ad.serial = Ad.generate_serial
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update_attributes(params[:ad])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to ads_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit'
    end
  end

  
end
