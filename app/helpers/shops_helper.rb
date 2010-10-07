module ShopsHelper

  def shop_address shop
    shop.street + ', ' + shop.city + ', Polska'
  end
end
