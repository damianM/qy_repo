class GalleryThumbnail < Thumbnail
  require 'RMagick'
  
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
  
end
