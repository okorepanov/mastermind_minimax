# frozen_string_literal: true

require './models/games/base_game'
require './models/file_writer'

module Games
  class ShowGame < BaseGame
    def initialize
      set_default_variables

      @game_number = 0
      @file_writer = FileWriter.new
    end

    def run
      while true
        process_round
        save_round_to_file
        set_default_variables
      end
    end

    private

    def process_round
      @game_number += 1
      puts "Game ##{@game_number}"

      DEFAULT_MAXIMUM_GUESSES.times do |guess_number|
        code_breaker_guess = @code_breaker.make_guess
        @steps << code_breaker_guess

        @code_breaker.score = calculate_score(code_breaker_guess, @code)

        if @code_breaker.score == WIN_SCORE
          @computer_win = true
          p [@code, guess_number + 1]
          break
        end
      end

      puts 'Computer Lose!' unless @computer_win
    end

    def save_round_to_file
      @file_writer.save_round(@game_number, @code, @steps, @steps.size)
    end

    def set_default_variables
      @computer_win = false
      @code = generate_random_code
      @code_breaker = ::CodeBreaker.new
      @steps = []
    end
  end
end
