class Quad < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  belongs_to :company

  validates_presence_of :company_id
  
  def rights?(u)
    self.user==u
  end
end
