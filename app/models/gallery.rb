class Gallery < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :galleriable, :polymorphic => true
  
  has_many :photos, :order => 'created_at'
  has_many :videos, :order => 'created_at'
  
  def rights?(usr)
    galleriable && ( galleriable.is_a?(User) ? galleriable == usr : galleriable.user == usr )
  end

  def to_param 
    "#{id}-#{name.to_url_format}"
  end

end
