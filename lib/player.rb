class Player

attr_accessor :name, :color

    def initialize (name, color)
        @name = name
        @color = color
    end

    def inspect
        @color
    end

    def to_s
        if @color == 'red'
          "\u{1F534}" # Red circle
        elsif @color == 'green'
          "\u{1F7E2}" # Green circle
        elsif @color == 'blue'
          "\u{1F535}" # Blue circle
        elsif @color == 'yellow'
          "\u{1F7E1}" # Yellow circle
        elsif @color == 'purple'
          "\u{1F7E3}" # Purple circle
        else
          "Invalid color"
        end
      end

end