def swap(a, b)
  return b, a
end

a, b = 1, 2
puts "Before: a=#{a}, b=#{b}"
a, b = swap(a, b)
puts "After: a=#{a}, b=#{b}"


