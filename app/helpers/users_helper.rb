module UsersHelper

  def pre_filler
    "<div style=\"whitespace:pre\"> </div>"
  end

  def setup_user(user)
    returning(user) do |u|
      u.build_quad unless u.quad
    end
  end

end
