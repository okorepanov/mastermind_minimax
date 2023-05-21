# frozen_string_literal: true

require './models/games/base_game'

module Games
  class UserCodeMakerGame < BaseGame
    def initialize
      print 'Input code: '

      @code = get_user_code
      @user_result = 'win'
      @code_breaker = CodeBreaker.new
    end

    def run
      DEFAULT_MAXIMUM_GUESSES.times do |guess_number|
        print "Guess №#{guess_number + 1}: "
        code_breaker_guess = @code_breaker.make_guess
        code_breaker_guess_score = calculate_score(code_breaker_guess, @code)
        @code_breaker.score = code_breaker_guess_score

        p code_breaker_guess

        puts "Answer: #{code_breaker_guess_score}"

        if code_breaker_guess_score == WIN_SCORE
          @user_result = 'lose'
          break
        end

        # Delay to better interact with user
        sleep 1

        @user_result = 'win' if guess_number == DEFAULT_MAXIMUM_GUESSES - 1
      end

      puts "You #{@user_result}!"
    end
  end
end
