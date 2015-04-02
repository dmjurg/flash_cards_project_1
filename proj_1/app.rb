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
      gets.chomp
      Card.where(correctly_answered: false).each do |card|
        puts "country: #{card.country}"
        user_input = gets.chomp
        return user_input if user_input == "exit"
        puts "capital: #{card.capital}"
        user_input = gets.chomp
        return user_input if user_input == "exit"
        puts "did you get it right? yes or no"
        user_input = gets.chomp
        return user_input if user_input == "exit"
        #   if "yes"
        #     card.correctly_answered = TRUE
        #   elsif "no"
        #     card.correctly_answered = FALSE
        #   else
        #     break
        #   end
        # break if user_input == "exit"
      end
    # end
  when "6"
    break
  end
end
