content = ''
file = File.new("ulysses.txt", "r")
while (line = file.gets)
    content << line
end
content.split(/\s+/).select{|e| e.length > 7}.group_by{|e| e}.sort{|a, b| b.last.count <=> a.last.count}.each do |group|
  word = group.first
  word_letters = word.split('')
  if word_letters.first.downcase[0] < word_letters.last.downcase[0]
    if word_letters.select{|e| e == word_letters.last }.count > 1
      puts word
      exit 0
    end
  end
end

