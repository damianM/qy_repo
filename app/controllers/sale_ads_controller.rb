# -*- coding: utf-8 -*-
class SaleAdsController < ApplicationController

  layout 'admin'
  
  def index
    @sale_ads = SaleAd.all
  end
  
  def new
    @sale_ad = SaleAd.new
    @sale_ad.serial = SaleAd.generate_serial
    
    render :action => 'new', :layout => 'application'
  end

  def create
    @sale_ad = SaleAd.new(params[:sale_ad])

    if @sale_ad.save
      flash[:notice] = "Ogłoszenie zostało dodane."

      redirect_to sale_ads_path
    else
      flash[:error]  = "Próba utworzenia ogłoszenia nie powiodła się."
      render :action => 'new', :layout => 'application'
    end
  end
  
  def show
    @sale_ad = SaleAd.find(params[:id])
  end
  
  def edit
    @sale_ad = SaleAd.find(params[:id])
    @sale_ad.serial = SaleAd.generate_serial

    render :action => 'edit', :layout => 'application'
  end

  def update
    @sale_ad = SaleAd.find(params[:id])

    if @sale_ad.update_attributes(params[:sale_ad])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to sale_ads_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit', :layout => 'application'
    end
  end

  def destroy
    @sale_ad = SaleAd.find(params[:id])
    @sale_ad.destroy
    flash[:notice] = "Ogłoszenie zostało usunięte."
    redirect_to sale_ads_path
  end


end
