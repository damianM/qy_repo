class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true
  
  has_attachment :storage => :file_system,
                 :max_size => 10.megabytes

  validates_as_attachment

  attr_accessible :serial



  def reset_serial
    update_attribute(:serial, nil)
  end



end
