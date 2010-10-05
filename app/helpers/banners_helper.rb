# -*- coding: utf-8 -*-
module BannersHelper

  def display_banner banner
    if asset = banner.assets.first
      asset.flash? ? flashobject_tag(asset.public_filename) : image_tag(asset.public_filename)
    end
  end

  def banner_options_for_positions_select object
    options = object.new_record? ? content_tag(:option, 'Wybierz', :value => '') : ''
    options += options_for_select([['główna-góra', 'main-top'], ['główna-quadomaniacy', 'main-quads'], ['główna-twoje konto', 'main-your_account']], object.position)
  end

end
