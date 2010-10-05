class Banner < ActiveRecord::Base
  
  attr_accessor :serial
  
  validates_presence_of :name, :position
  validates_length_of :name, :maximum => 64

  has_many :assets, :as => :assetable, :class_name => 'Attachment', :dependent => :destroy

  after_save :attach_assets
  
  named_scope :active, :conditions => ["activated_at <= ? AND deactivated_at >= ?", Date.today.to_s(:db), Date.today.to_s(:db)]
  

  class << self
    def acceptable_assets_quantity
      1
    end

    def generate_serial
      Digest::SHA1.hexdigest(Kernel.rand(1000000).to_s + "rand")[0..15]
    end    
  end
  
  protected

  def attach_assets
    if serial
      assets << Attachment.find_all_by_serial(serial, :order => 'created_at DESC')
      assets.each(&:reset_serial)
    end
  end

end
