class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true
  
  has_attachment :storage => :file_system

  validates_as_attachment

  def reset_serial
    update_attribute(:serial, nil)
  end

end
