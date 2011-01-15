class Image < Asset
  require 'RMagick'

  Image.attachment_options.merge!( :content_type => Technoweenie::AttachmentFu.content_types,
                                   :path_prefix  => '/public/uploads/' + self.name.to_s.downcase.pluralize,
                                   :processor => :Rmagick,
                                   :max_size => 3.megabytes,
                                   :resize_to => [423, 246],
                                   :thumbnails => { :thumb => [93, 71], :main => [242, 151] },
                                   :thumbnail_class => Image )


  def flash?
    content_type == 'application/x-shockwave-flash'
  end

end
