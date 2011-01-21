# -*- coding: utf-8 -*-
class AdsController < ApplicationController

  before_filter :login_required
  
  def home 
    @day_offer = SaleAd.find(:first, :conditions => {:day_offer => true})
    @special_ads = SaleAd.find(:all, :conditions => {:special => true})
  end
  
  def search
    case params[:ad_type]
    when 'sale_ad'
      @ads = SaleAd.all
    when 'buy_add'
      @ads = SaleAd.all
    else
      @ads = SaleAd.all + BuyAd.all
    end
  end


end
