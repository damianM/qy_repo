class Photo < ActiveRecord::Base
  require 'RMagick'

  belongs_to :gallery
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_one :prate
  
  has_attachment :storage => :file_system,
                 :content_type => :image,
                 :path_prefix  => '/public/uploads/',
                 :processor => :Rmagick,
                 :max_size => 2.megabytes,
                 :resize_to => 'x133',
                 :thumbnails => { :main => '80x80', :thumb => 'x65' }


  validates_as_attachment
  
  
  def rights?(usr)
    gallery.rights?(usr)
  end
  
end

