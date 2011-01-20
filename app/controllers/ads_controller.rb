# -*- coding: utf-8 -*-
class AdsController < ApplicationController

  before_filter :login_required
  
  def home 
    @day_offer = SaleAd.find(:first, :conditions => {:day_offer => true})
    @special_ads = SaleAd.find(:all, :conditions => {:special => true})
  end
  
  def search

  end


end
