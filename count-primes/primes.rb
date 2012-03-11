prime_counter = 0

def is_prime(n)
   return false if n<2
   2.upto(Math.sqrt(n).to_i){|i|  return false if n%i==0}
 return true
end

def is_palindrom(number)
  number.to_s == number.to_s.reverse
end

(2..100000000).each do |number|
  if is_palindrom(number)
    prime_counter += 1 if is_prime(number)
  end
end

puts prime_counter