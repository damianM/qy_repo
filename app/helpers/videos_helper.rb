module VideosHelper

  def add_video_button label
    link_to_function label do |page|
      page.replace_html :add_form, :partial => 'videos/new', :locals => { :video => Video.new }
    end
  end

end
