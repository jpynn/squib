require 'squib'

Squib::Deck.new do
  use_layout file: '_default_layout.yml'
  default fill_color: :blue
  rect x: 0, y: 0, width: 100, height: 100
  default fill_color: :red
  rect x: 100, y: 0, width: 100, height: 100
  rect x: 200, y: 0, width: 100, height: 100, layout: :foo
  save_png prefix: "default_"
end
