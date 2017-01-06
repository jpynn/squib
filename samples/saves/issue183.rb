# require 'squib'
require_relative '../../lib/squib'

Squib::Deck.new(width: 100, height: 100) do
  background color: :orange
  text str: 'Scaled!', font: 'Sans 20'

  save_png prefix: 'save_png_no_scaled_'
  save_png prefix: 'save_png_no_scaled_trimmed_', trim: 15, trim_radius: 25
  # save_png supports scaling to a different size
  save_png width: 150, height: 50, range: 0, prefix: 'save_png_scaled_'
  save_png width: 150, height: 50, range: 0, trim: 15, trim_radius: 25, prefix: 'save_png_scaled_trimmed_'
  # save_png width:
          #  range: 0, prefix: 'save_png_scaled_trimmed_', trim: 30, trim_radius: 37.5,
end
