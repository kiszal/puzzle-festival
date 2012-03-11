lcm_final = 1
puts (1..42).collect{|n| lcm_final = lcm_final.lcm(n) }.last

