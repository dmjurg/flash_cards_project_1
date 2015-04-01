require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/card'


def get_new_card
  card_attr = {}
  puts "What country?"
  card_attr[:country] = gets.chomp
  puts "What is the capital?"
  card_attr[:capital] = gets.chomp
  return card_attr
end

def get_card
  puts "Which card?"
  puts Card.all
  card_country = gets.chomp
  return Card.find_by(country: card_country)
end

puts Card.all

Card.create(get_new_card)

card = get_card
puts "Please make your changes"
new_country = gets.chomp
card.country = new_country
new_capital = gets.chomp
card.capital = new_capital
card.save

card = get_card
card.destroy
