module BooksHelper
  def available_currencies
    %w[$ €]
  end

  def period(string)
    return unless string.present?
    "#{string}."
  end
end
