# -*- coding: utf-8 -*-
module AdsHelper

  def conditions_for_select
    [['nowy','new'],['używany','used'],['uszkodzony','damaged'],['nie określono','not_specified']]
  end

  def sellers_for_select
    [['właściciel','owner'],['dealer','dealer'],['komis','commission'],['nie określono','not_specified']]
  end

  def categories_for_select
    [['pojazd','quad'],['części','parts'],['akcesoria','accessories']]
  end
  
end
