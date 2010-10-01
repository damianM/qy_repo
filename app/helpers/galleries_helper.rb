module GalleriesHelper

  def setup_gallery object
    @gallery = object.galleries.build
  end

end
