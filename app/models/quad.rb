class Quad < ActiveRecord::Base
belongs_to :gallery
belongs_to :user

  def rights?(u)
    self.user==u
  end
end
