class Gallery < ActiveRecord::Base
  require 'RMagick'
  include Magick

  validates_presence_of :name

  belongs_to :event
  belongs_to :user
  has_many :photos
  has_many :videos

  def rights?(usr)
    usr==user or (event!=nil and usr==event.user)
  end

  def generate_thumb
    cd="public/images/data/#{self.user_id}/"
    Dir.mkdir(cd) unless File.exist?(cd)
    self.thumb="data/#{self.user_id}/#{(Time.now.to_f*100).to_i.to_s}.png"
    system("cp public/gallery.png public/images/#{self.thumb}")
    system("convert #{"public/images/"+self.thumb} #{"public/images/"+self.thumb.gsub(/\./,"t.")}")
  end


  def regenerate_thumb
    path="public/images/"+ self.thumb

    grav = [NorthWestGravity,SouthEastGravity,NorthEastGravity,SouthWestGravity,CenterGravity]
    ptt=self.photos.size>4 ? self.photos[-5..-1] : self.photos
    images = ptt.collect{|x| ImageList.new("public/images/" + x.link)}
    images.collect!{|x| x=x.paint_transparent "white",TransparentOpacity,false,3}
    images.collect!{|x| x.rotate!(rand(2)==0 ? - rand(15) -10 : rand(15)+10)}
    images.collect!{|x| x.resize_to_fit!(50,50)}
    images.collect!{|x| x=x.paint_transparent "white",TransparentOpacity,false,3}
    
      image=ImageList.new("public/gallery.png")
    img=Image.new(118,100)
    img.composite!(image,0,0,OverCompositeOp)
    images.each_with_index do |x,indx|
      img.composite!(x,grav[indx],OverCompositeOp)
    end
    img.write("public/images/"+self.thumb)
    system("convert #{"public/images/"+self.thumb} -resize \"75x65>\" #{"public/images/"+self.thumb.gsub(/\./,"t.")}")
  end
end
