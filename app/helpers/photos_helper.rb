module PhotosHelper

  def toggle_photo_form label
    link_to_function label do |page|
      page['buttons'].toggle()
      page['photo_form'].toggle()
    end
  end

end
