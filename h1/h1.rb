t = gets.to_i

results = []
1.upto(t) do |times|
  a,b,n = gets.chomp.split(' ').map(&:to_i)

  result = []
  first_term = a + b
  result << first_term
  last_term = first_term
  1.upto(n-1) do |i|
      last_term = last_term + (2 ** i) * b
      result << last_term
  end
  results << result
end

results.each do |r|
  puts r.join(' ')
end
