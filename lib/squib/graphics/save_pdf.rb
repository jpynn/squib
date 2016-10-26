module Squib
  module Graphics
    class SavePDF

      def initialize(deck)
        @deck = deck
      end

      # :nodoc:
      # @api private
      def render_pdf(range, sheet)
        cc = init_cc(sheet)
        cc.scale(72.0 / @deck.dpi, 72.0 / @deck.dpi) # for bug #62
        x, y         = sheet.margin, sheet.margin
        card_width   = @deck.width  - 2 * sheet.trim
        card_height  = @deck.height - 2 * sheet.trim
        track_progress(range, sheet) do |bar|
          range.each do |i|
            card = @deck.cards[i]
            cc.translate(x, y)
            cc.rectangle(sheet.trim, sheet.trim, card_width, card_height)
            cc.clip
            case card.backend.downcase.to_sym
            when :memory
              cc.set_source(card.cairo_surface, 0, 0)
              cc.paint
            when :svg
              card.cairo_surface.finish
              cc.save
              cc.scale(0.8, 0.8) # I really don't know why I needed to do this at all. But 0.8 is the magic number to get this to scale right
              cc.render_rsvg_handle(RSVG::Handle.new_from_file(card.svgfile), nil)
              cc.restore
            else
              abort "No such back end supported for save_pdf: #{backend}"
            end
            bar.increment
            cc.reset_clip
            cc.translate(-x, -y)
            draw_crop_marks(cc, x, y, sheet) if sheet.crop_marks
            x += card.width + sheet.gap - 2 * sheet.trim
            if x > (sheet.width - card_width - sheet.margin)
              x = sheet.margin
              y += card.height + sheet.gap - 2 * sheet.trim
              if y > (sheet.height - card_height - sheet.margin)
                cc.show_page # next page
                x, y = sheet.margin, sheet.margin
              end
            end
          end
        end
        cc.target.finish
      end

      private

      # Initialize the Cairo Context
      def init_cc(sheet)
        Cairo::Context.new(Cairo::PDFSurface.new(
          "#{sheet.dir}/#{sheet.file}",
          sheet.width * 72.0 / @deck.dpi,  #PDF thinks in 72 DPI "points"
          sheet.height * 72.0 / @deck.dpi)
        )
      end

      def track_progress(range, sheet)
        msg = "Saving PDF to #{sheet.full_filename}"
        @deck.progress_bar.start(msg, range.size) { |bar| yield(bar) }
      end

      def draw_crop_marks(cc, x, y, sheet)
        draw_line(cc, sheet,  # Vertical, Upper-left
                  x + sheet.trim, 0,
                  x + sheet.trim, sheet.margin - 1)
        draw_line(cc, sheet,  # Vertical, Upper-right
                  x + @deck.width - sheet.trim, 0,
                  x + @deck.width - sheet.trim, sheet.margin - 1)
        draw_line(cc, sheet,  # Vertical, Lower-left
                  x + sheet.trim, sheet.height,
                  x + sheet.trim, sheet.height - sheet.margin + 1)
        draw_line(cc, sheet,  # Vertical, Lower-right
                  x + @deck.width - sheet.trim, sheet.height,
                  x + @deck.width - sheet.trim, sheet.height - sheet.margin + 1)
        draw_line(cc, sheet,  # Horizontal, Upper-left
                  0               , y + sheet.trim,
                  sheet.margin - 1, y + sheet.trim)
        draw_line(cc, sheet,  # Horizontal, Upper-Right
                  sheet.width                   , y + sheet.trim,
                  sheet.width - sheet.margin + 1, y + sheet.trim)
        draw_line(cc, sheet,  # Horizontal, Lower-Left
                  0               , y + @deck.height - sheet.trim,
                  sheet.margin - 1, y + @deck.height - sheet.trim)
        draw_line(cc, sheet,  # Horizontal, Lower-Left
                  sheet.width                   , y + @deck.height - sheet.trim,
                  sheet.width - sheet.margin + 1, y + @deck.height - sheet.trim)
      end

      def draw_line(cc, sheet, x1, y1, x2, y2)
        cc.move_to(x1, y1)
        cc.line_to(x2, y2)
        cc.set_source_color(sheet.crop_stroke_color)
        cc.set_dash(sheet.crop_stroke_dash)
        cc.set_line_width(sheet.crop_stroke_width)
        cc.stroke
      end
    end
  end
end
