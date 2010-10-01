class Gallery < ActiveRecord::Base
  validates_presence_of :name
  
  belongs_to :event
  belongs_to :user
  has_many :photos, :order => 'created_at'
  has_many :videos, :order => 'created_at'
  
  def rights?(usr)
    usr==user or (event!=nil and usr==event.user)
  end

end
