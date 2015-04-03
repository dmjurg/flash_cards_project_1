require 'active_record'
require_relative 'connection'
require_relative '../lib/card'
require_relative '../lib/deck'

Card.destroy_all
Deck.destroy_all

decks = Deck.create([
  {category: "europe"},
  {category: "asia"},
  {category: "africa"},
  {category: "americas"},
  {category: "oceania"}
  ])

europe = Deck.find_by(category: "europe")
europe_deck = europe.cards.create([
  {country: "Ireland", capital: "Dublin", correctly_answered: FALSE},
  {country: "Germany", capital: "Berlin", correctly_answered: FALSE},
  {country: "Italy", capital: "Rome", correctly_answered: FALSE}
  ])

asia = Deck.find_by(category: "asia")
asia_deck = asia.cards.create([
  {country: "India", capital: "New Delhi", correctly_answered: FALSE},
  {country: "China", capital: "Beijing", correctly_answered: FALSE},
  {country: "Japan", capital: "Tokyo", correctly_answered: FALSE}
  ])

africa = Deck.find_by(category: "africa")
africa_deck = africa.cards.create([
  {country: "Egypt", capital: "Cairo", correctly_answered: FALSE},
  {country: "Ethiopia", capital: "Addis Ababa", correctly_answered: FALSE},
  {country: "Morocco", capital: "Rabat", correctly_answered: FALSE}
  ])

americas = Deck.find_by(category: "americas")
americas_deck = americas.cards.create([
  {country: "Peru", capital: "Lima", correctly_answered: FALSE},
  {country: "Argentina", capital: "Buenos Aires", correctly_answered: FALSE},
  {country: "Canada", capital: "Ottowa", correctly_answered: FALSE},
  {country: "Ecuador", capital: "Quito", correctly_answered: FALSE}
  ])

oceania = Deck.find_by(category: "oceania")
oceania_deck = oceania.cards.create([
  {country: "Australia", capital: "Canberra", correctly_answered: FALSE}
  ])
