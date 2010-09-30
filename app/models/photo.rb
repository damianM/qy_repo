class Photo < ActiveRecord::Base
  belongs_to :gallery
  has_one :prate
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  def remove
    cd="public/images"
    begin
      File.delete(cd+"/"+self.link)
      File.delete(cd+"/"+self.thumb)
    rescue
    end
  end
  
  def image?(p)
    unless p.content_type=~/^image/
      return false
    end
    return true
  end
  
  def rights?(usr)
    gallery.rights?(usr)
  end
  
  def thumb80     
    self.link.gsub /(\/\d*\/)/, '\080_t'
  end
end

