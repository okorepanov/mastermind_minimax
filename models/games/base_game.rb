# frozen_string_literal: true

require './modules/game_helper'
require './models/code_breaker'

module Games
  class BaseGame
    include GameHelper

    def self.run
      new.run
    end

    def run
      raise NotImplementedError
    end

    private

    def get_user_code
      user_code = gets.chomp

      until valid_code?(user_code)
        print "Invalid code!\nTry again: "
        user_code = gets.chomp
      end

      user_code
    end
  end
end
