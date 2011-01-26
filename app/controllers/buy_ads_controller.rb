# -*- coding: utf-8 -*-
class BuyAdsController < ApplicationController
  before_filter :login_required
  before_filter :find_buy_ad, :except => [ :index, :new, :create ]
  
  layout 'admin'
  
  def index
    @buy_ads = admin? ? BuyAd.all : current_user.buy_ads
  end
  
  def new
    @buy_ad = BuyAd.new
    render :action => 'new', :layout => 'application'
  end

  def create
    @buy_ad = BuyAd.new(params[:buy_ad])
    @buy_ad.user_id = current_user.id

    if @buy_ad.save
      flash[:notice] = "Ogłoszenie zostało dodane."
      redirect_to home_ads_path
    else
      flash[:error]  = "Próba utworzenia ogłoszenia nie powiodła się."
      render :action => 'new', :layout => 'application'
    end
  end
  
  def show
  end
  
  def edit
    render :action => 'edit', :layout => 'application'
  end

  def update
    if @buy_ad.update_attributes(params[:buy_ad])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to home_ads_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit', :layout => 'application'
    end
  end

  def destroy
    @buy_ad.destroy
    flash[:notice] = "Ogłoszenie zostało usunięte"
    redirect_to buy_ads_path
  end

  protected

  def find_buy_ad
    begin
      @buy_ad = admin? ? BuyAd.find(params[:id]) : current_user.buy_ads.find_by_id(params[:id])
      raise 'Ogłoszenie nie zostało odnalezione.' unless @buy_ad
    rescue Exception => exception
      if request.xhr?
        render :json => { :success => false, :message => exception.message }
      else
        flash[:error] = exception.message
        redirect_to root_path
      end
      return false
    end
  end

end
