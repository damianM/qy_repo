class Userprate < ActiveRecord::Base
  belongs_to :user
  belongs_to :prate
end

