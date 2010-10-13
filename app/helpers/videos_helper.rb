module VideosHelper

  def toggle_video_form label, *args
    options = args.extract_options!
    reload = options.delete(:reload)
    
    link_to_function label do |page|
      unless reload.nil?
        page.reload
      else
        page['buttons'].toggle()
        page['video_form'].toggle()
      end
    end
  end

end
