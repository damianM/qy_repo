class Photo < ActiveRecord::Base
  require 'RMagick'

  belongs_to :gallery

  has_many :comments, :as => :commentable, :dependent => :destroy

  has_many :rates, :as => :rateatable, :dependent => :destroy
  has_many :voters, :through => :rates, :source => :user
  
  has_attachment :storage => :file_system,
                 :content_type => :image,
                 :path_prefix  => '/public/uploads/',
                 :processor => :Rmagick,
                 :max_size => 10.megabytes,
                 :resize_to => 'x133',
                 :thumbnails => { :main => [85, 80], :thumb => [74, 74] }


  validates_as_attachment

  validates_presence_of :description, :if => Proc.new { |record| record.parent_id.blank? }

  attr_accessible :gallery_id, :description

  def increase_display_counter
    update_attribute(:counter, counter + 1)
  end

  def to_param 
    "#{id}-#{description.to_url_format}"
  end
  
  def rights?(usr)
    gallery.rights?(usr)
  end
  
end

