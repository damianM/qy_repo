class Thumbnail < ActiveRecord::Base
  require 'action_controller'
  require 'action_controller/test_process.rb'

  has_one :video

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :path_prefix  => '/public/uploads/'
  
  def self.create!(vpath)
    tpath = vpath 
    system "ffmpeg -i #{vpath} -ss 20 -s 150x100 -vframes 1 -f image2 -an #{tpath}"
    t = Thumbnail.new(:uploaded_data => ActionController::TestUploadedFile.new(tpath, 'image/jpeg'))
    t.save ? t : false
  end
end
