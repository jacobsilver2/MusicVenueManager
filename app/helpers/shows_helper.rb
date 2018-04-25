module ShowsHelper

  def format_date(show)
    show.date.strftime("%B %e, %Y")
  end

  def format_time(show)
    show.start_time.strftime("%l:%M %p")
  end


end
