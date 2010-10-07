class Image < Asset

  Image.attachment_options.merge!( :content_type => [ 'image/jpeg', 'image/jpg', 'image/gif'],
                                        :path_prefix  => '/public/uploads/' + self.name.to_s.downcase.pluralize,
                                        :thumbnail_class => Image )

  def flash?
    content_type == 'application/x-shockwave-flash'
  end

end
