require './question'
require './player'

puts "Welcome!"
puts "This is a multiplayer math game to get better at addition!"
puts "Please enter your name (Player 1)"

player1 = gets.chomp
first = Player.new(player1)

puts "Please enter your name (Player 2)"

player2 = gets.chomp
second = Player.new(player2)

puts "Lets start the game!"

@game_state = true
@turn = 0

while @game_state do
  question = Question.new
  case @turn
  when 0
    puts "#{first.name}: #{question.random_question}"
    answer = gets.chomp.to_i
    if question.correct?(answer)
      first.correct
      puts "#{first.name}: Correct!"
      puts "#{first.name}: #{first.name} #{first.life}/3 vs #{second.name} #{second.life}/3"
      puts "-----"
      @turn += 1
    else
      first.incorrect
      puts "#{first.name}: Incorrect!"
      puts "#{first.name}: #{first.name} #{first.life}/3 vs #{second.name} #{second.life}/3"
      puts "-----"
      @turn += 1
    end
  when 1
    puts "#{second.name}: #{question.random_question}"
    answer = gets.chomp.to_i
    if question.correct?(answer)
      second.correct
      puts "#{second.name}: Correct!"
      puts "#{second.name}: #{first.name} #{first.life}/3 vs #{second.name} #{second.life}/3"
      puts "-----"
      @turn -= 1
    else
      second.incorrect
      puts "#{second.name}: Incorrect!"
      puts "#{second.name}: #{first.name} #{first.life}/3 vs #{second.name} #{second.life}/3"
      puts "-----"
      @turn -= 1
    end
  end
  if first.life == 0 || second.life == 0
    @game_state = false
  end
end

puts "Thank you for playing!"

if first.life > second.life
  puts "#{first.name} won!"
else
  puts "#{second.name} won!"
end
