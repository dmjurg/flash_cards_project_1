require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/card'
require_relative 'lib/deck'

def menu
  puts " ****** MENU ******
  1. View all cards
  2. Create a card
  3. Edit a card
  4. Delete a card
  5. PLAY THE GAME
  6. Quit"
  return gets.chomp
end

loop do

  choice = menu
  case choice

  when "1"
    puts Card.all
  when "2"
    Card.create(create_new_card)
  when "3"
    card = which_card
    puts card
    puts "Please make your changes
    country:"
    new_country = gets.chomp
    card.country = new_country
    puts "Please make your changes
    capital:"
    new_capital = gets.chomp
    card.capital = new_capital
    card.save
  when "4"
    card = which_card
    card.destroy
  when "5"
    puts "    **********
    game time!
    press 'enter' to flip your card
    or to move to the next card
    **********
    type 'exit' to exit the game"
    user_input = gets.chomp

    while user_input != "exit"
      Card.where(correctly_answered: FALSE).each do |card|
        puts "country: #{card.country}"
        user_input = gets.chomp
        if user_input == "exit"
          break
        end
        puts "capital: #{card.capital}"
        user_input = gets.chomp
        if user_input == "exit"
          break
        end
        puts "did you get it right? yes or no"
        user_input = gets.chomp
        if user_input == "exit"
          break
        elsif user_input == "yes"
          card.correctly_answered = TRUE
          card.save
        elsif user_input == "no"
          card.correctly_answered = FALSE
          card.save
        else
        end

      end
    end

  when "6"
    break
  end
end
