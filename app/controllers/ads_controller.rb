# -*- coding: utf-8 -*-
class AdsController < ApplicationController

  before_filter :login_required
  
  def home 
    @day_offer = SaleAd.find(:first, :conditions => {:day_offer => true})
    @special_ads = SaleAd.find(:all, :conditions => {:special => true})
  end
  
  def search
    store_location

    if request.post?
      conditions =  "id != '' "
      conditions += " and category = '#{params[:category]}'" unless params[:category].blank? 
      conditions += " and state_id = '#{params[:state_id]}'" unless params[:state_id].blank? 
      
      unless params[:price_range].blank?
        chunks = params[:price_range].split('-')
        conditions += " and price between #{chunks[0]} and #{chunks[1]}"
      end
      
      conditions += " and company_id = '#{params[:company_id]}'" unless params[:company_id].blank?
      conditions += " and kind = '#{params[:kind]}'" unless params[:kind].blank? 
      conditions += " and year = '#{params[:date][:year]}'" unless params[:date].blank? || params[:date][:year].blank? 
      
      unless params[:mileage_range].blank?
        chunks = params[:mileage_range].split('-')
        conditions += " and mileage between #{chunks[0]} and #{chunks[1]}"
      end
      
      unless params[:capacity].blank?
        chunks = params[:capacity].split('-')
        conditions += " and capacity between #{chunks[0]} and #{chunks[1]}"
      end
      
      conditions += " and status = '#{params[:status]}'" unless params[:status].blank?
      conditions += " and seller = '#{params[:seller]}'" unless params[:seller].blank?
      
      case params[:ad_type]
      when 'sale_ad'
        @ads = SaleAd.find(:all, :conditions => conditions)
      when 'buy_ad'
        @ads = BuyAd.find(:all, :conditions => conditions)
      else
        @ads = SaleAd.find(:all, :conditions => conditions) + BuyAd.find(:all, :conditions => conditions)
      end
    else
      @ads = admin? ? ( BuyAd.all + SaleAd.all ) : ( current_user.buy_ads + current_user.sale_ads )
    end
  end

  def show
    @ad = Ad.find(params[:id])

    params[:per_page] ||= 1
    @photos = @ad.assets.paginate(:page => params[:page], :per_page => params[:per_page])

  end

end
