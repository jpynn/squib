require 'squib'

Squib::Deck.new(cards: 2) do
  background color: '#230602'

  text str: %w( Attack Defend ),
       color: '#F3EFE3', font: 'ChunkFive Roman,Sans 72',
       y: '2.5in', width: '2.75in', align: :center

  svg file: %w(attack.svg defend.svg),
      width: 500, height: 500,
      x: 150, y: 250 # icons adapted from game-icons.net

  save_png prefix: 'better_'
end
