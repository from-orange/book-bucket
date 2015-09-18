module ApplicationHelper
  def full_title(title)
    origin = "Book Bucket"
    if !title.blank?
      "#{origin} | #{title}"
    else
      origin
    end
  end

  def needed_time(time)
    time.strftime("%D")
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def offer_sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == offer_sort_column) ? "current #{sort_direction}" : nil
    direction = (column == offer_sort_column && offer_sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:offer_sort => column, :offer_direction => direction}, {:offer_class => css_class}
  end
end
