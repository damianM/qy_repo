class Store < ActiveRecord::Base

  validates_presence_of :name, :position  
end
