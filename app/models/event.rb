class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_category
  has_many :files, :class_name => "Efile"

  has_many :galleries, :as => :galleriable, :dependent => :destroy

  validates_presence_of :title,:description,:place,:organiser_name,:organiser_address,:organiser_phone

  def rights?(u)
    self.user == u
  end
  
  def to_param 
    "#{id}-#{title.to_url_format}"
  end

end
