module ApplicationHelper
  include CurrentUserHelper

  def in_dollars(cents)
    number_to_currency(cents / 100.0)
  end

end
