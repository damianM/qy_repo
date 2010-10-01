class AdvertsController < ApplicationController

  layout 'admin'
  
  def index
    @adverts = Advert.all
  end

end
