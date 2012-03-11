require 'nokogiri'

coded = ''
file = File.new("play.txt", "r")
while (line = file.gets)
    coded << line
end

data = File.read "full.html"
doc  = Nokogiri::HTML data
decoded = ''

def decode_letter(letter, number)
  offset = 13
  if (letter.ord - offset) >=  number
    (letter.ord - offset).chr
  else
    (letter.ord + 26 - offset).chr
  end
end

coded.split('').each do |letter|
  decoded << if letter.match(/[a-z]/)
    decode_letter(letter, 97)
  elsif letter.match(/[A-Z]/)
     decode_letter(letter, 65)
  else
    letter
  end
end

first_line = decoded.split("\n").first
els  = doc.search "[text()*='#{first_line}']"
puts els.first.parent.previous_element.children.first.text


