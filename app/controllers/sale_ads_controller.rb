# -*- coding: utf-8 -*-
class SaleAdsController < ApplicationController
  before_filter :login_required
  before_filter :find_sale_ad, :except => [ :index, :new, :create ]

  layout 'admin'
  
  def index
    @sale_ads = admin? ? SaleAd.all : current_user.sale_ads
  end
  
  def new
    @sale_ad = SaleAd.new
    @sale_ad.serial = SaleAd.generate_serial
    
    render :action => 'new', :layout => 'application'
  end

  def create
    @sale_ad = SaleAd.new(params[:sale_ad])
    @sale_ad.user_id = current_user.id

    if @sale_ad.save
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
    @sale_ad.serial = SaleAd.generate_serial
    render :action => 'edit', :layout => 'application'
  end

  def update
    if @sale_ad.update_attributes(params[:sale_ad])
      flash[:notice] = "Edycja przebiegła pomyślnie."
      redirect_to home_ads_path
    else
      flash[:error]  = "Edycja nie powiodła się."
      render :action => 'edit', :layout => 'application'
    end
  end

  def destroy
    @sale_ad.destroy
    flash[:notice] = "Ogłoszenie zostało usunięte."
    redirect_to sale_ads_path
  end
  
  protected

  def find_sale_ad
    begin
      @sale_ad = admin? ? SaleAd.find(params[:id]) : current_user.sale_ads.find_by_id(params[:id])
      raise 'Ogłoszenie nie zostało odnalezione.' unless @sale_ad
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
