class Event < ActiveRecord::Base
  acts_as_ferret :remote => true
  belongs_to :user
  has_many :files, :class_name => "Efile"
  has_many :galleries

  validates_presence_of :title,:description,:place,:organiser_name,:organiser_address,:organiser_phone

  def rights?(u)
    self.user==u
  end
end
