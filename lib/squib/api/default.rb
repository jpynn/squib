module Squib
  class Deck
    def default(opts = {})
      @defaults ||= {}
      opts.each do |param, value|
        @defaults[param] = value
      end
    end
  end
end
