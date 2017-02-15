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
end                              # => :already_guessed

def bad_guess (guess, low, high)
  if guess > high
    puts "Are you even listening to the clues? That's way too high."
  elsif guess < low
    puts "Why do I even try with you? You know that's too low. Put in some effort."
  end
end

def compare_to_random (guess, random)
  if guess == random
    return "win"
  elsif guess < random
    return "low"
  elsif guess > random
    return "high"
  end
end                                    # => :compare_to_random

random = random_number  # => 50
number_of_guesses = 1   # => 1
guesses = []            # => []
lowest_possible = 1
highest_possible = 100

loop do
  input = gets.chomp.to_i  # ~> NoMethodError: undefined method `chomp' for nil:NilClass

  if number_of_guesses > 4
    puts "You lose"
    puts "The number was #{random}"
    break
  end

  if already_guessed(input, guesses) != ""
    puts already_guessed(input, guesses)
  end

  bad_guess(input, lowest_possible, highest_possible)

  if compare_to_random(input, random) == "low"
    puts "Too low"
    if input > lowest_possible
      lowest_possible = input
    end
  elsif compare_to_random(input, random) == "high"
    puts "Too high"
    if input < highest_possible
      highest_possible = input
    end
  elsif compare_to_random(input, random) == "win"
    puts "You win!"
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
