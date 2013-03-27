module RestaurantsHelper

  def shorten(s)
    return s if s.length < 20
    s[0..20] + "..."
  end

end
