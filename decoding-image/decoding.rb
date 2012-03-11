require 'chunky_png'

image = ChunkyPNG::Image.from_file('encoded.png')

new_image = ChunkyPNG::Image.new( image.width, image.height, ChunkyPNG::Color::TRANSPARENT)


difference = 0
width = image.width
height = image.height

array = []

(0..(width-1)).each do |x|
  (0..(height-1)).each do |y|
    array << image[x,y]
  end
end

(0..(height-1)).each do |y|
  (0..(width-1)).each do |x|
    new_image[x,y] = array.shift
  end
end



new_image.save('solution.png')