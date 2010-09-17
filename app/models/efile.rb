class Efile < ActiveRecord::Base
  belongs_to :event

  PATH="public/images/data"

  def make f,user
    self.name = f.original_filename
    cd=PATH + "/" + user.id.to_s
    Dir.mkdir(cd) unless File.exist?(cd)

    self.link = (cd + "/" + self.name).gsub "public",""

    
    return system("mv #{f.path} public#{self.link} && chmod o+r public#{self.link}") ? self : nil

  end
end
