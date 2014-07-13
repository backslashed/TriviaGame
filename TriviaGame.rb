require "csv"

class TriviaGame
  SCORE_CORRECT = 10
  SCORE_INCORRECT = -5

  # Read CSV file and store tests
  def initialize(file)
    @tests = []

    CSV.foreach(file) do |line| 
      @tests << { question: line[0], answer: line[1].strip }
    end
  end

  # Start game with given number of levels
  def play(number_of_games)
    @tests.shuffle!
    score = 0
    number_of_games.times { |level| score += get_score_for @tests[level] }
    STDOUT.puts "You scored #{score}/#{SCORE_CORRECT * number_of_games}"
  end

  private

  # Get score based on user input to test
  def get_score_for(test)
    print test[:question] + "\n> "
    is_answer_correct?( STDIN.gets, test ) ? SCORE_CORRECT : SCORE_INCORRECT
  end

  def is_answer_correct?(answer, test)
    answer.chomp.downcase == test[:answer].downcase
  end
end