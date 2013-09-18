module ApplicationHelper

  def nice_datetime(datetime)
    datetime.strftime("%A %B #{datetime.day.ordinalize} %Y, %l:%M %p").sub(/(\d)([a-z]+)/, '\1<sup>\2</sup>').html_safe
  end

end
