random = rand(100)                       # => 90
puts "Guess a number between 1 and 100"  # => nil
number_of_guesses = 1                    # => 1
guesses = []                             # => []

def already_guessed (guess, guesses)
  if guesses.include? guess
    return "Really? #{guess} Again?"
  else
    guesses << guess
    return ""
  end
end                                   # => :already_guessed

def compare_to_random (guess, random)
  if guess.to_i == random
    puts "You win!"
    return "win"
  elsif guess.to_i < random
    puts "Too low"
  elsif guess.to_i > random
    puts "Too high"
  end
end

loop do
  input = gets.chomp

  if number_of_guesses > 4
    puts "You lose"
    break
  end

  if already_guessed(input, guesses) != ""
    puts already_guessed(input, guesses)
  end

  if compare_to_random(input, random) == "win"
    break
  end

  number_of_guesses += 1
end
