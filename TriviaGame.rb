require "csv"

class TriviaGame
  SCORE_CORRECT = 10
  SCORE_INCORRECT = -5

  public

  def initialize(file)
    @tests = []
    CSV.foreach(file) { |line| load_test(line) }
  end

  # Play a round with a given number of tests
  def play(number_of_tests)
    return if number_of_tests > @tests.size
    reset_game
    run_tests(number_of_tests)
  end

  private

  # Load a test from an array
  def load_test(test)
    @tests << { question: test[0], answer: test[1].strip }
  end

  # Shuffle tests and reset score
  def reset_game
    @score = 0
    @tests.shuffle!
  end

  # Run given number of tests
  def run_tests(levels)
    levels.times { |round| ask_question @tests[round] }
    display_score
  end

  # Run a given test
  def ask_question(test)
    print test[:question] + "\n> "
    @score += is_answer_correct?(gets, test) ? SCORE_CORRECT : SCORE_INCORRECT
  end

  # Check if the answer to a test is correct
  def is_answer_correct?(answer, test)
    answer.chomp.downcase == test[:answer].downcase
  end

  # Display the score to a game
  def display_score
    puts @score >= 0 ? "Score: #{@score}!" : "You've lost. Try again."
  end
end