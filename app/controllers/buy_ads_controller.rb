# -*- coding: utf-8 -*-
class BuyAdsController < ApplicationController
  
  layout 'admin'
  
  def index
    @buy_ads = BuyAd.all
  end
  
  def new
    @buy_ad = BuyAd.new
    @buy_ad.serial = BuyAd.generate_serial
  end

  def create
    @buy_ad = BuyAd.new(params[:buy_ad])

    if @buy_ad.save
      flash[:notice] = "Ogłoszenie zostało dodane."
      redirect_to buy_ads_path
    else
      flash[:error]  = "Próba utworzenia ogłoszenia nie powiodła się."
      render :action => 'new'
    end
  end
  
  def show
    @buy_ad = BuyAd.find(params[:id])
  end
  
  def edit
    @buy_ad = BuyAd.find(params[:id])
    @buy_ad.serial = BuyAd.generate_serial
  end

  def update
    @buy_ad = BuyAd.find(params[:id])
    if @buy_ad.update_attributes(params[:buy_ad])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to buy_ads_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit'
    end
  end

  def destroy
    @buy_ad = BuyAd.find(params[:id])
    @buy_ad.destroy
    flash[:notice] = "Ogłoszenie zostało usunięte"
    redirect_to buy_ads_path
  end

end
