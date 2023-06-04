require 'set'
require './modules/game_helper'
require 'byebug'
class CodeBreaker
  include GameHelper

  attr_accessor :score
  attr_reader :possible_answers, :possible_scores

  def initialize
    @guess_number = 0
    @guesses = 0
    @score = ''
    @all_scores = Hash.new { |h, k| h[k] = {} }
    @all_answers = ALLOWED_SYMBOLS.chars.product(*[ALLOWED_SYMBOLS.chars] * (CODE_LENGTH - 1)).map(&:join)

    @all_answers.product(@all_answers).each do |guess, answer|
      @all_scores[guess][answer] = calculate_score(guess, answer)
    end

    @all_answers = @all_answers.to_set

    # [1111, 1112, ..., 6666]
    @possible_answers = @all_answers.dup
    # [1111, { 1111 => 'BBBB', 1112 => 'BBBB', ..., 6666 => '' }]
    @possible_scores = @all_scores.dup
  end

  def make_guess
    if @guess_number > 0
      @guess_number += 1

      @possible_answers.keep_if do |answer|
        @all_scores[@guess][answer] == @score
      end

      @guesses = @possible_scores.map do |guess, scores_by_answer|
        scores_by_answer = scores_by_answer.select do |answer, _|
          @possible_answers.include?(answer)
        end
        @possible_scores[guess] = scores_by_answer

        score_groups = scores_by_answer.values.group_by(&:itself)
        possibility_counts = score_groups.values.map(&:length)
        worst_case_possibility = possibility_counts.max
        impossible_guess = @possible_answers.include?(guess) ? 0 : 1
        [worst_case_possibility, impossible_guess, guess]
      end

      @guess = @guesses.min.last.to_s
    else
      @guess_number += 1

      @guess = '1122'
    end
  end
end
