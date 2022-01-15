puts "------------------"
puts "------------------"
puts "------------------"
puts "Deleting all games"
Game.destroy_all

puts "------------------"
puts "------------------"
puts "------------------"
puts "Creating all games"
File.open("words_size_5.txt").read.split("\n").shuffle.each_with_index do |word, index|
    Game.create(word: word)
    puts "created #{index + 1} word(s)"
end