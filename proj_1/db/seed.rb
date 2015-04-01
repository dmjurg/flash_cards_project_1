require_relative '../app'

Card.destroy_all

cards = Card.create([
  {country: "Norway", capital: "Oslo"}
  ])
