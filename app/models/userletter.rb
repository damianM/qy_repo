class Userletter < ActiveRecord::Base
  belongs_to :user
  belongs_to :letter
end
