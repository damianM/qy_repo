class GalleryThumbnail < Thumbnail
  require 'RMagick'
  include Magick
  
  GalleryThumbnail.attachment_options.merge!(:resize_to => [117, 100],
                                             :processor => :Rmagick )

  def self.generate!
    thumb = RAILS_ROOT + "/public/gallery.png"
    if thumb && FileTest.exist?(thumb)
      #mimetype = `file -ib #{thumb}`.gsub(/\n/,"")
      p = GalleryThumbnail.new(:uploaded_data => ActionController::TestUploadedFile.new(thumb, 'image/png'))
      p.save ? p : false
    end
  end
  
  def self.regenerate!(gallery_id)
    gallery = Gallery.find(gallery_id)

    gravity = [NorthWestGravity, SouthEastGravity, NorthEastGravity, SouthWestGravity, CenterGravity]

    images = gallery.photos.size > 4 ? gallery.photos[-5..-1] : gallery.photos
    images.reject!{|i| !FileTest.exist?(RAILS_ROOT + '/public' + i.public_filename)}

    images = images.collect{|x| ImageList.new('public' + x.public_filename)}
    
    images.collect!{|x| x = x.paint_transparent "white", TransparentOpacity, false, 3}
    images.collect!{|x| x.rotate!(rand(2)==0 ? - rand(15) -10 : rand(15)+10)}
    images.collect!{|x| x.resize_to_fit!(50,50)}
    images.collect!{|x| x = x.paint_transparent "white", TransparentOpacity, false, 3}

    
    image = ImageList.new("public/gallery.png")

    img = Image.new(117, 100)
    img.composite!(image, 0, 0, OverCompositeOp)
    images.each_with_index do |x, indx|
      img.composite!(x, gravity[indx], OverCompositeOp)
    end

    thumb = "tmp/thumbnails/" + (Time.now.to_f*100).to_i.to_s + '.png'
    img.write(thumb)

    if FileTest.exist?(thumb)
      p = GalleryThumbnail.new(:uploaded_data => ActionController::TestUploadedFile.new(thumb, 'image/png'))
      p.save ? p : false
    end

  end
  
end
