class Gallery < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :galleriable, :polymorphic => true
  
  has_many :photos, :order => 'created_at'
  has_many :videos, :order => 'created_at'
  
  def rights?(usr)
    galleriable && ( galleriable == usr  || galleriable.user == usr )
  end

end
