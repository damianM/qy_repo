class Company < ActiveRecord::Base
  has_many :quads
  validates_presence_of :name
end
