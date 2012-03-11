counter = 0
(1...10000).each do |number|
  counter += number.to_s.length
  if counter == 6941
    puts number
    exit
  end
end