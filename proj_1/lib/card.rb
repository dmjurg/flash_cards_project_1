class Card < ActiveRecord::Base
  belongs_to :deck

  validates :country, presence: true
  validates :capital, presence: true

  def to_s
    return "country: #{country}"
  end

end

def create_new_card
  card_attr = {}
  puts "What country?"
  card_attr[:country] = gets.chomp
  puts "What is the capital?"
  card_attr[:capital] = gets.chomp
  card_attr[:correctly_answered] = FALSE
  card_attr[:deck_id] = 1
  return card_attr
end

def which_card
  puts "Which card?"
  puts Card.all
  card_country = gets.chomp
  return Card.find_by(country: card_country)
end
