# -*- coding: utf-8 -*-
module BannersHelper

  def display_banner position
    if banner = Banner.active.find_all_by_position(position).rand
      if asset = banner.assets.first
        asset.flash? ? flashobject_tag(asset.public_filename) : image_tag(asset.public_filename)
      end
    end
  end

  def banner_options_for_positions_select object
    options = object.new_record? ? content_tag(:option, 'Wybierz', :value => '') : ''
    options += options_for_select([['główna-góra', 'main-top'], ['główna-quadomaniacy', 'main-quads'], ['główna-twoje konto', 'main-your_account']], object.position)
  end

end
