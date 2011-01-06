class Image < Asset

  Image.attachment_options.merge!( :content_type => [ 'image/jpeg', 'image/jpg', 'image/gif','image/png'],
                                        :path_prefix  => '/public/uploads/' + self.name.to_s.downcase.pluralize,
                                        :thumbnail_class => Image, :resize_to => [242, 151] )

  def flash?
    content_type == 'application/x-shockwave-flash'
  end

end
