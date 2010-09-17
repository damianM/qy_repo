class Uservrate < ActiveRecord::Base
  belongs_to :user
  belongs_to :vrate
end
