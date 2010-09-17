class Prate < ActiveRecord::Base
belongs_to :photo
  has_many :userprates
  has_many :users, :through => :userprates, :source => :user
end
