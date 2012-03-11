require 'chunky_png'

class Island
  BLUE_ARGB = 9631999
  BLUE = -1
  YELLOW = -2

  def initialize(file_name = 'islands.png')
    @image = ChunkyPNG::Image.from_file(file_name)
    @matrix = (1..@image.width).inject([]){|a, e| a << []}
    @color = 0
  end

  def height
    @height ||= @image.height
  end

  def width
    @width ||= @image.width
  end

  def color
    @color
  end

  def next_color
    @color += 1
  end

  def transform_image
    (0..(self.height-1)).each do |y|
      (0..(self.width-1)).each do |x|
        @matrix[x][y] = (@image[x,y]  == BLUE_ARGB ? BLUE : YELLOW)
      end
    end
  end

  def process
    (0..(self.height-1)).each do |y|
      (0..(self.width-1)).each do |x|
        if @matrix[x][y] == YELLOW
          mark(x,y)
          next_color
        end
      end
    end
  end

  def mark(x,y)
    if @matrix[x][y] == YELLOW
      @matrix[x][y] = color
      mark(x-1, y) if x > 0
      mark(x+1, y) if x < self.width - 1
      mark(x, y-1) if y > 0
      mark(x, y+1) if y < self.height - 1
    end
  end

  def quantity
    @color
  end

end

island = Island.new
island.transform_image
island.process
puts island.quantity
