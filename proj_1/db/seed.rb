require 'active_record'
require_relative 'connection'
require_relative '../lib/card'
require_relative '../lib/deck'

Card.destroy_all
Deck.destroy_all

decks = Deck.create([
  {category: "countries worldwide"}
  ])

world = Deck.find_by(category: "countries worldwide")
world_deck = world.cards.create([
  {country: "United Kingdom", capital: "London", correctly_answered: FALSE},
  {country: "Ireland", capital: "Dublin", correctly_answered: FALSE},
  {country: "Germany", capital: "Berlin", correctly_answered: FALSE},
  {country: "Italy", capital: "Rome", correctly_answered: FALSE},
  {country: "Norway", capital: "Oslo", correctly_answered: FALSE},
  {country: "Austria", capital: "Vienna", correctly_answered: FALSE},
  {country: "Sweden", capital: "Stockholm", correctly_answered: FALSE},
  {country: "Peru", capital: "Lima", correctly_answered: FALSE},
  {country: "India", capital: "New Delhi", correctly_answered: FALSE},
  {country: "China", capital: "Beijing", correctly_answered: FALSE},
  {country: "Brazil", capital: "Brasilia", correctly_answered: FALSE},
  {country: "Japan", capital: "Tokyo", correctly_answered: FALSE},
  {country: "Philippines", capital: "Manila", correctly_answered: FALSE},
  {country: "Mexico", capital: "Mexico City", correctly_answered: FALSE},
  {country: "Canada", capital: "Ottowa", correctly_answered: FALSE},
  {country: "Ecuador", capital: "Quito", correctly_answered: FALSE},
  {country: "Australia", capital: "Canberra", correctly_answered: FALSE},
  {country: "Egypt", capital: "Cairo", correctly_answered: FALSE},
  {country: "Ethiopia", capital: "Addis Ababa", correctly_answered: FALSE},
  {country: "Uganda", capital: "Kampala", correctly_answered: FALSE},
  {country: "Morocco", capital: "Rabat", correctly_answered: FALSE}
])
