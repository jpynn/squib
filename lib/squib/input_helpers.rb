module Squib
  module InputHelpers

    def rangeify (range)
      range = 0..(@cards.size-1) if range == :all
      range = range..range if range.is_a? Integer
      if range.max > (@cards.size-1)
        raise "#{range} is outside of deck range of 0..#{@card.size-1}"
      end
      return range
    end
    module_function :rangeify

    def fileify(file)
      raise 'File #{file} does not exist!' unless File.exists? file
      file
    end
    module_function :fileify

    def colorify(color, nillable: false)
      if nillable # for optional color arguments like text hints
        color = Cairo::Color.parse(color) unless color.nil?
      else
        color ||= :black
        color = Cairo::Color.parse(color)
      end
      color
    end
    module_function :colorify

    def fontify (font)
      font = @font if font==:use_set
      font = Squib::DEFAULT_FONT if font==:default
      font 
    end
    module_function :fontify

  end
end