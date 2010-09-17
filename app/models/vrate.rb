class Vrate < ActiveRecord::Base
  belongs_to :video
  has_many :uservrates
  has_many :users, :through => :uservrates, :source => :user
end
