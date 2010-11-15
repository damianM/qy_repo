module GalleriesHelper

  def setup_gallery object
    @gallery = object.galleries.build
  end


  def create_gallery_link galleriable    
    if galleriable.is_a?(User)
      create_user_gallery_path({:user_id => galleriable.id})
    elsif galleriable.is_a?(Event)
      create_event_gallery_path({:event_id => galleriable.id})
    end
  end
end
