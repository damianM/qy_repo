# -*- coding: utf-8 -*-
module AdsHelper

  def statuses_for_select
    [['nowy','new'],['używany','used'],['uszkodzony','damaged'],['nie określono','not_specified']]
  end

  def sellers_for_select
    [['właściciel','owner'],['dealer','dealer'],['komis','commission'],['nie określono','not_specified']]
  end

  def categories_for_select
    [['pojazd','quad'],['części i akcesoria','parts']]
  end

  def ad_types_for_select
    [['wszystkie','all'],['sprzedam','sale_ad'],['kupię','buy_ad']]
  end

  def statuses_in_pl status
    case status
      when 'new' then 'nowy'
      when 'used' then 'używany'
      when 'damaged' then 'uszkodzony'
      else 'nie określonio'
    end
  end

  def categories_in_pl category
    case category
      when 'quad' then 'pojazd'
      when 'parts' then 'części'
      else 'inne'
    end
  end
  
  def ad_prices_for_select
    array = []
    
    start_from = 0
    20.times do |i|
      array += [start_from.to_s+'-'+(start_from+5000).to_s].zip
      start_from = start_from + 5000
    end
    
    array += [['pow. 100000','100000-more']]
    return array
  end

  def ad_mileages_for_select
    array = []
    
    start_from = 0
    10.times do |i|
      array += [start_from.to_s+'-'+(start_from+1000).to_s].zip
      start_from = start_from + 1000
    end
    
    array += [['pow. 10000','10000-more']]
    return array
  end

  def ad_capacitys_for_select
    array = []
    
    start_from = 0
    10.times do |i|
      array += [start_from.to_s+'-'+(start_from+100).to_s].zip
      start_from = start_from + 100
    end
    
    array += [['pow. 1000','1000-more']]
    return array
  end

end
