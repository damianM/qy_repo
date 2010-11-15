class Video < ActiveRecord::Base

  # validates_presence_of :title

  belongs_to :gallery
  belongs_to :thumbnail, :dependent => :destroy

  has_many :comments, :as => :commentable, :dependent => :destroy

  has_many :rates, :as => :rateatable, :dependent => :destroy
  has_many :voters, :through => :rates, :source => :user

  has_attachment :storage => :file_system, 
                 :content_type => :video,
                 :path_prefix  => '/public/uploads/',
                 :max_size => 100.megabytes

  before_create :save_thumbnail

  attr_accessible :title, :description, :gallery_id

  #turn off attachment_fu's auto file renaming 
  #when you change the value of the filename field
  def rename_file
    true
  end

  #acts as state machine plugin
  acts_as_state_machine :initial => :pending
  state :pending
  state :converting
  state :converted, :enter => :set_new_filename
  state :error

  event :convert do
    transitions :from => :pending, :to => :converting
  end

  event :converted do
    transitions :from => :converting, :to => :converted
  end

  event :failure do
    transitions :from => :converting, :to => :error
  end

  # This method is called from the controller and takes care of the converting
  def convert
    self.convert!
    success = system(convert_command)
    if success && $?.exitstatus == 0
      self.converted!
    else
      self.failure!
    end
  end

  def increase_display_counter
    update_attribute(:counter, counter + 1)
  end

  def save_thumbnail
    self.thumbnail = Thumbnail.create!(self.temp_path)
  end
  
  def self.top10
    find(:all, :joins => :gallery, :order => "counter desc", :limit => 10)
  end
  
  def self.latest
    find(:all, :joins => :gallery, :order => "created_at desc", :limit => 7)
  end

  def self.search search
    conditions = search.blank? ? '' : "title LIKE '%#{search}%' OR description LIKE '%#{search}%'"
    find(:all, :conditions => conditions)
  end
  
  def rights?(usr)
     gallery.rights?(usr)
  end

  def to_param 
    "#{id}-#{description.to_url_format}"
  end
  
  protected

  def convert_command
    #construct new file extension
    flv =  "." + id.to_s + ".flv"

    #build the command to execute ffmpeg
    command = <<-end_command
     ffmpeg -i #{ RAILS_ROOT + '/public' + public_filename }  -ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y #{ RAILS_ROOT + '/public' + public_filename + flv }  
    end_command
    
    command
  end

  # This updates the stored filename with the new flash video file
  def set_new_filename
    update_attribute(:filename, "#{filename}.#{id}.flv")
    update_attribute(:content_type, "application/x-flash-video")
  end

end
