module Squib
  # @api private
  module Args

    # Special class for handling the sizes of images.
    # These need to be handled earlier for text embedding
    class EmbedSizeHandler

      # Modifies the box width and height to replace with native sizes
      def self.svg_native_size!(deck_size, box, ifile, svg_args)
        0.upto(deck_size - 1) do  |i|
          if(box[i].width == :native || box[i].height == :native)
            Squib.logger.warn 'Both an SVG file and SVG data were specified' unless ifile[i].file.to_s.empty? || svg_args[i].data.to_s.empty?
            unless (ifile[i].file.nil? or ifile[i].file.eql? '') and
                    svg_args[i].data.nil?
              puts "File is: #{ifile}"
              data = File.read(ifile[i].file) if svg_args[i].data.to_s.empty?
              svg          = RSVG::Handle.new_from_data(data)
              box[i].width    = svg.width  if box[i].width == :native
              box[i].height   = svg.height if box[i].height == :native
              puts box[i]
            end
          end
        end
      end

      # Modifies the box width and height to replace with native sizes
      def self.png_native_size!(deck_size, box, pngfile)
        0.upto(deck_size - 1) do  |i|
          if((box[i].width == :native || box[i].height == :native) &&
             !pngfile[i].nil? && pngfile[i].eql?(''))
            png = Squib.cache_load_image(pngfile[i])
            box[i].width    = png.width.to_f  if box[i].width  == :native
            box[i].height   = png.height.to_f if box[i].height == :native
          end
        end
      end

    end

  end
end
