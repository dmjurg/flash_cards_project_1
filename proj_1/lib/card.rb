class Card < ActiveRecord::Base

  def to_s
    return "country: #{country}"
  end
end
