class Attachment < Asset

  Attachment.attachment_options.merge!( :content_type => [ 'image/jpeg', 'image/jpg', 'image/gif', 'application/x-shockwave-flash'],
                                        :path_prefix  => '/public/uploads/' + self.name.to_s.downcase.pluralize,
                                        :thumbnail_class => Attachment )

  def flash?
    content_type == 'application/x-shockwave-flash'
  end

end
