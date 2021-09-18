require 'gosu'


class Game < Gosu::Window
  def initialize(w, h)
    super w, h
    @w = w
    @h = h
    self.caption = "Conway's Game of Life"
    @scale = 10
    @x_cells = @w / @scale
    @y_cells = @h / @scale
    @survival_rate = 0.6
    @board = Array.new(@y_cells) { Array.new(@x_cells) {rand < @survival_rate ? 1 : 0} }
    @editing = false
    @barrier = false
    @speed = 0.05
  end

  def empty_board
    @board = Array.new(@y_cells) { Array.new(@x_cells) {0} }
  end

  def display
    display_str = ""

    @board.each { |row| display_str << "#{row.join ' '}\n" }

    display_str.gsub("0", " ").gsub("1", "\#")
  end

  def draw
    Gosu.draw_rect(0, 0, @w , @h, Gosu::Color.argb(0xff_000000))
    dead_color = @editing ? Gosu::Color.argb(0xff_ff0000) : Gosu::Color.argb(0xff_000000)
    @board.each_with_index { |row, y|
      row.each_with_index { |status, x|
        Gosu.draw_rect(
          (x * @scale) + 1,
          (y * @scale) + 1, 
          @scale - 2, @scale - 2, 
          (status == 1 ? Gosu::Color.argb(0xff_ffffff) : dead_color))
      }
    }
  end

  def update
    sleep(@speed)

    return if @editing

    census = []
    @board.each_with_index{ |row, y|
      census << [] 
      row.each_with_index{ |status, x|
        
        neighbours = 0
        for dy in -1..1 do
          for dx in -1..1 do 
            if @barrier
              if (y + dy).between?(0, @y_cells - 1) && (x + dx).between?(0, @x_cells - 1)
                neighbours += @board[(y + dy)][(x + dx)]
              end
            else
              neighbours += @board[(y + dy) % @y_cells][(x + dx) % @x_cells]
            end
          end
        end

        if @board[y][x] == 0
          census.last << (neighbours == 3 ? 1 : 0)
        else
          census.last << ([3,4].include?(neighbours) ? 1 : 0)
        end
      }
    }

    @board = census
    return
  end

  def button_down(id)
    case id
    
    when Gosu::KB_E then @editing = !@editing
    
    when Gosu::KB_B then @barrier = !@barrier
      
    when Gosu::KB_R then empty_board
    
    when Gosu::MS_LEFT 
      x = mouse_x.to_i / @scale
      y = mouse_y.to_i / @scale
      @board[y][x] = (@board[y][x] + 1) % 2
    
    when Gosu::MS_WHEEL_UP, Gosu::KB_UP then @speed = [0.01, @speed - 0.01].max
    
    when Gosu::MS_WHEEL_DOWN, Gosu::KB_DOWN then @speed = [1, @speed + 0.01].min
    
    when Gosu::KB_ESCAPE then exit
    
    end
  end
end

window = Game.new(1920, 1080)
window.show
