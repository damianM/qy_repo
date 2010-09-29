# -*- coding: utf-8 -*-
class State < ActiveRecord::Base
  has_many :users  
  validates_presence_of :name
end
