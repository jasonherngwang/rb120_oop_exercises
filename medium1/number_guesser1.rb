class GuessingGame
  GUESS_LIMIT = 7
  NUMBER_RANGE = 1..100
  
  def initialize
    @guesses_remaining = GUESS_LIMIT
    @secret_number = rand(NUMBER_RANGE)
    @guess
  end

  def display_guesses_remaining
    if @guesses_remaining == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{@guesses_remaining} guesses remaining."
    end
  end

  def out_of_guesses?
    @guesses_remaining <= 0
  end

  def correct_guess?
    @guess == @secret_number
  end

  def prompt_for_guess
    @guess = ''
    loop do
      print\
        "Enter a number between #{NUMBER_RANGE.first} and #{NUMBER_RANGE.last}: "
      @guess = gets.chomp
      break if valid_guess?
      print "Invalid guess. "
    end
    @guess = @guess.to_i
  end

  def valid_guess?
    @guess == @guess.to_i.to_s &&
    NUMBER_RANGE.include?(@guess.to_i) 
  end

  def display_guess_high_low
    if @guess > @secret_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low"
    end
  end

  def decrement_guesses_remaining
    @guesses_remaining -= 1
  end

  def display_game_result
    if correct_guess?
      puts "That's the number!"
      puts
      display_winning_message
    else
      puts
      display_losing_message
    end
  end

  def display_losing_message
    puts "You have no more guesses. You lost!"
  end

  def display_winning_message
    puts "You won!"
  end

  def play
    loop do
      # puts @secret_number
      display_guesses_remaining
      prompt_for_guess
      decrement_guesses_remaining
      break if correct_guess? || out_of_guesses?
      display_guess_high_low
    end
    display_game_result
  end
end

game = GuessingGame.new
game.play