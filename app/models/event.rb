class Event < ActiveRecord::Base
  belongs_to :user
  has_many :files, :class_name => "Efile"
  has_many :galleries

  validates_presence_of :title,:description,:place,:organiser_name,:organiser_address,:organiser_phone

  def rights?(u)
    self.user==u
  end
end
