module ApplicationHelper
  def full_title(title)
    origin = "Book Bucket"
    if !title.nil?
      "#{origin} | #{title}"
    else
      origin
    end
  end
end
