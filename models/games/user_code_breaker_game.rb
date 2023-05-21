# frozen_string_literal: true

require './models/games/base_game'

module Games
  class UserCodeBreakerGame < BaseGame
    def initialize
      @code = generate_random_code
      @user_result = 'lose'
    end

    def run
      DEFAULT_MAXIMUM_GUESSES.times do |guess_number|
        print "Guess №#{guess_number + 1}: "

        user_guess = get_user_code
        user_score = calculate_score(user_guess, @code)

        puts "Answer: #{user_score}"

        if user_score == WIN_SCORE
          @user_result = 'win'
          break
        end

        @user_result = 'lose' if guess_number == DEFAULT_MAXIMUM_GUESSES - 1
      end

      puts "You #{@user_result}!\nCode: #{@code}"
    end
  end
end
