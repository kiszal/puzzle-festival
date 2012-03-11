require 'chunky_png'

image_a = ChunkyPNG::Image.from_file('img_a.png')#image = ChunkyPNG::Image.from_file('img_a.png')
image_b = ChunkyPNG::Image.from_file('img_b.png')


difference = 0
width = image_a.width
height = image_a.height

(0..(width-1)).each do |x|
  (0..(height-1)).each do |y|
    difference += 1 if image_a[x,y] != image_b[x,y]
  end
end

puts difference


