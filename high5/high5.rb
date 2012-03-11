correct_numbers = []

right_number = false

(10000..99999).each do |number|
  right_number = false
  digits = number.to_s.split('')
  if digits.uniq.size == 5
    digits.each_with_index do |digit, index|
      digit = digit.to_i
      break if digit == 0 or number%digit != 0
      right_number = true if index == 4
    end
  end
  correct_numbers.push(number) if right_number
end

puts correct_numbers.inject(:+).to_s