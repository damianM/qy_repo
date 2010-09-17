class Userquery < ActiveRecord::Base
  belongs_to :query
  belongs_to :user
end
