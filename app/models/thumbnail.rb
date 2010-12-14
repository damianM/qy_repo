class Thumbnail < ActiveRecord::Base
  require 'action_controller'
  require 'action_controller/test_process.rb'

  belongs_to :thumbnailable, :polymorphic => true

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :path_prefix  => "/public/uploads",
                 :resize_to => [93, 71]


  validates_as_attachment
  
  def self.create!(vpath)
    tpath = vpath + ".jpg"
    system "ffmpegthumbnailer  -i #{vpath} -o #{tpath} -s96"
    #system "ffmpeg -i #{vpath} -ss 20 -s 150x100 -vframes 1 -f image2 -an #{tpath}"
    t = Thumbnail.new(:uploaded_data => ActionController::TestUploadedFile.new(tpath, 'image/jpeg'))
    t.save ? t : false
  end
  
end
