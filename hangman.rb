
ATTEMPTS=9

# Return true if the array of characters matches the word
def is_solved(word, characters)
  # TODO 1: Iterate over the characters of 'word', and compare them to
  # the characters in the 'characters' array
  #
  # Return true if all characters match
  # Return false if there is at least one mismatch
  #
  for i in 0..(word.length) do
    if (word[i] != characters[i])
      return false
    end
  end
  return true
end

# Print the characters guessed so far
def output(attempts, characters)
  # TODO 2: Iterate over the characters and print them. Then, print
  # the remaining attempts
  for i in 0..(characters.length) do
    print characters[i]
  end
  puts ""
  puts "Remaining attempts: " + attempts.to_s
end

# Checks if a guessed character occurs in the word.
# Update all occurrences of the character in the 
# array of already guessed characters
def update_and_check(characters, word, guess)
  found = false
  (0...word.length).each do |w|                      
    # TODO 3: Make the check case insensitive
    if word[w] == guess
      found = true
      # Update the characters array
      characters[w] = word[w]
    end
  end
  return found
end


# The basic game logic: Keep asking for characters until dead or won
def game_loop
  
  words = ["COM1001", "Hello", "Sheffield"]
  word = words.sample
  characters = Array.new word.length, "_"
  attempts = ATTEMPTS

  # Keep querying for a new character until the game is over
  while (!is_solved(word, characters)) && attempts > 0 do
    output attempts, characters
    print "Your next guess: "
    c = gets.chomp
    if ! update_and_check characters, word, c
      attempts -= 1
    end
  end
  

  # Once the current game is over, inform the player of the outcome
  if is_solved word, characters then
    puts "You have won with #{ATTEMPTS-attempts} wrong attempts!"
  else
    puts "You have lost."
  end
end

# TODO 4: After each completed game, ask the player if they want to
# play another game. If not, quit. If yes, start another game.