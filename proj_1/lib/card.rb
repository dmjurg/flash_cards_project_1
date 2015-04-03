class Card < ActiveRecord::Base
  belongs_to :deck

  validates :country, presence: true
  validates :capital, presence: true
  validates :deck_id, presence: true

  def to_s
    return "country: #{country}"
  end
  
end
