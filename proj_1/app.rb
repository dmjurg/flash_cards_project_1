require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'lib/card'
require_relative 'lib/deck'

def get_user_input(prompt)
  puts prompt
  gets.chomp
end

def create_new_card
  card_attr = {}
  puts "What country?"
  card_attr[:country] = gets.chomp
  # card_attr[:country] = get_user_input("What country?")
  puts "What is the capital?"
  card_attr[:capital] = gets.chomp
  card_attr[:correctly_answered] = FALSE
  puts "What category/continent? Please choose a number"
  puts Deck.all
  card_attr[:deck_id] = gets.chomp
  return card_attr
end

def which_card
  puts "Which card?"
  puts Card.all
  card_country = gets.chomp
  return Card.find_by(country: card_country)
end

def menu
  puts " ****** MENU ******
  1. Start a new game
  2. Return to an existing game
  3. View all cards
  4. View all categories
  5. Create a card
  6. Edit a card
  7. Delete a card
  8. View my score
  9. Exit"
  return gets.chomp
end

puts "GUESS THE COUNTRY'S CAPITAL"

loop do

  choice = menu
  case choice

  when "1"
    Card.all.each do |card|
      card.correctly_answered = FALSE
      card.save
    end

    puts "Which deck would you like to use?
    Type 'all' or the relevant id number"
    puts Deck.all
    deck_choice = gets.chomp

    if deck_choice == "all"
      puts "********** GaMe TiMe! **********
      Press 'enter' to flip your card
      and to move to the next card
      **********
      type 'exit' to exit the game
      **********"
      user_input = gets.chomp

      while user_input != "exit" && Card.where(correctly_answered: FALSE).size > 0
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
          else
          end
        end
      end

    else
      puts "********** GaMe TiMe! **********
      Press 'enter' to flip your card
      and to move to the next card
      **********
      type 'exit' to exit the game
      **********"
      user_input = gets.chomp
      while user_input != "exit" && Card.where(deck_id: deck_choice).where(correctly_answered: FALSE).size > 0
        puts "Exit status: #{user_input}"
        puts "Size: #{Card.where(deck_id: deck_choice).where(correctly_answered: FALSE).size}"
        Card.where(deck_id: deck_choice).where(correctly_answered: FALSE).each do |card|
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
          else
          end
        end
      end
    end

  when "2"
    puts "    **********
    game time!
    press 'enter' to flip your card
    or to move to the next card
    **********
    type 'exit' to exit the game"
    user_input = gets.chomp
    while user_input != "exit" && Card.where(correctly_answered: FALSE).size > 0
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
        else
        end
      end
    end

  when "3"
    puts Card.all

  when "4"
    puts Deck.all

  when "5"
    Card.create(create_new_card)

  when "6"
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

  when "7"
    card = which_card
    card.destroy

  when "8"
    puts "I know the capitals of #{Card.where(correctly_answered: TRUE).count} countries!"

  when "9"
    break
  end
end
