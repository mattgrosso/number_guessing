puts "Guess a number between 1 and 100"  # => nil

def random_number
  return (1..100).to_a.sample  # => 50
end                            # => :random_number

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
end                                    # => :compare_to_random

random = random_number  # => 50
number_of_guesses = 1   # => 1
guesses = []            # => []

loop do
  input = gets.chomp  # ~> NoMethodError: undefined method `chomp' for nil:NilClass

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

# >> Guess a number between 1 and 100

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/MJG/Desktop/IronCode/RubyAudit/number_guessing/guessing_game.rb:32:in `block in <main>'
# ~> /Users/MJG/Desktop/IronCode/RubyAudit/number_guessing/guessing_game.rb:31:in `loop'
# ~> /Users/MJG/Desktop/IronCode/RubyAudit/number_guessing/guessing_game.rb:31:in `<main>'
