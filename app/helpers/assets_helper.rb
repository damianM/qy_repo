module AssetsHelper

  def setup_asset object
    Asset.new(:serial => object.serial)
  end
  
end
