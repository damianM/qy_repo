class Ad < ActiveRecord::Base

  attr_accessor :serial
  
  validates_presence_of :title

  has_many :assets, :as => :assetable, :class_name => 'Image', :dependent => :destroy

  after_save :attach_assets
  
  
  class << self
    def acceptable_assets_quantity
      3
    end

    def generate_serial
      Digest::SHA1.hexdigest(Kernel.rand(1000000).to_s + "rand")[0..15]
    end    
  end
  
  protected

  def attach_assets
    if serial
      assets << Image.find_all_by_serial(serial, :order => 'created_at DESC')
      assets.each(&:reset_serial)
    end
  end

end
