class MessageDetails < ActiveRecord::Base
  belongs_to :message



  def trash
    self.update_attribute(:details,self.details|1)
  end

  def trash?
    (self.details&1)!=0
  end

  def send_trash
    self.update_attribute(:details,self.details|2)
  end

  def send_trash?
    (self.details&2)!=0
  end

end
