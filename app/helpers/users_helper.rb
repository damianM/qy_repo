# -*- coding: utf-8 -*-
module UsersHelper

  def pre_filler
    "<div style=\"whitespace:pre\"> </div>"
  end

  def setup_user(user)
    returning(user) do |u|
      u.build_quad unless u.quad
    end
  end

  def user_type_in_polish type
    {'Admin' => 'Administrator Systemu',nil => 'Użytkownik'}[type]
  end

  def user_states_for_select
    [['Aktywny','active'],['Nieaktywny','suspended']]
  end

  def state_options_for_select state = nil
    options_for_select([["aktywny", "active"], ["nieaktywny", "suspended"]], state.to_s)
  end

end
