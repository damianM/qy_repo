class Video < ActiveRecord::Base
  require "rvideo.rb"

  belongs_to :gallery
  has_one :vrate

  has_many :comments, :as => :commentable, :dependent => :destroy

  validates_presence_of :description

  IMAGE_PATH="public/images/data"
  
  def convert(file,user)
    puts "Converting file #{file} sized #{File.size(file)}"
    cd=IMAGE_PATH + "/" + user.id.to_s
    Dir.mkdir(cd) unless File.exist?(cd)
    time=(Time.now.to_f*1000).to_i.to_s
    name=cd+"/"+ time + ".flv"
    name2=cd+"/"+ time + "x.flv"
    File.open(name2,"w"){|w|
      w.write(file.read)
    }
    system("ffmpegthumbnailer  -i #{name2} -o #{name[0...-3] + "jpg"} -s96")
    system("composite -gravity center public/triangle.png #{name[0...-3] + "jpg"} #{name[0...-3] + "jpg"}")

    #    file = RVideo::Inspector.new(:file => "#{name}")
    #    transcoder = RVideo::Transcoder.new
    c=false
    if system("ffmpeg -i #{name2} -s 512x384 -f flv -ab 128000 -ar 44100 -vcodec flv -b 1000000 -y #{name}")
      if system("flvtool2 -U #{name}")
        if system("rm -rf #{name2}")
        c=true
        end
      end
    end
    #    begin
    #      transcoder.execute(recipe, {:input_file => name,
    #          :output_file => name[0...-3] + "flv", :resolution => "640x360"})
    #    rescue RVideo::TranscoderError => e
    #      puts "Unable to transcode file: #{e.class} - #{e.message}"
    #    end
    
    #system("ffmpeg -y -i #{name} -acodec libfaac -ar 44100 -ab 96k -vcodec libx264 -level 41 -crf 25 -bufsize 20000k -maxrate 25000k -g 250 -r 20 -s 1280x720 -coder 1 -flags +loop -cmp +chroma -partitions +parti4x4+partp8x8+partb8x8 -flags2 +brdo+dct8x8+bpyramid -me umh -subq 7 -me_range 16 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -rc_eq 'blurCplx^(1-qComp)' -bf 16 -b_strategy 1 -bidir_refine 1 -refs 6 -deblockalpha 0 -deblockbeta 0 #{name}")
    
    self.link="data" + "/" + user.id.to_s + "/"+ time + ".flv"
    c
  end

  def rights?(user)
    gallery.rights?(user)
  end

  def remove
    cd="public/images"
    File.delete(cd+"/"+self.link)

    File.delete(cd + "/" + self.link[0...-3] + "jpg")
  end
end
