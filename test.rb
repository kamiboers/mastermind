words = %w(dog dog dog dog dog dog cat cat cat mouse)

counts = Hash.new 0

words.each do |word|
  counts[word] += 1
end

puts counts
