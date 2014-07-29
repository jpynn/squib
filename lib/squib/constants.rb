module Squib
    
    #@api public
    SYSTEM_DEFAULTS = { 
   		:range => :all,
   		:color => :black,
      :str => '',
      :fill_color => '#0000',
      :stroke_color => :black,
      :stroke_width => 2.0,
   		:font => :use_set,
      :default_font => 'Arial 36',
   		:sheet => 0,
   		:x => 0,
   		:y => 0,
      :x_radius => 0, 
      :y_radius => 0,
      :align => :left,
      :valign => :top,
      :justify => false,
      :ellipsize => :end,
      :width => :native,
      :height => :native,
   		:alpha => 1.0,
      :format => :png,
      :dir => "_output",
      :prefix => "card_",
      :margin => 75,
      :gap => 0,
      :trim => 0
    }

end