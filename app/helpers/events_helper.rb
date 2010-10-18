module EventsHelper

  
  def toggle_gallery_form label
    link_to_function label do |page|
      #page['buttons'].toggle()
      page['gallery_form'].toggle()
    end
  end

end
