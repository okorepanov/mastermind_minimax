require './modules/game_options'

module GameHelper
  include GameOptions

  def generate_random_code
    CODE_LENGTH.times.map { ALLOWED_SYMBOLS.chars.sample }.join
  end

  def valid_code?(code)
    code.length == CODE_LENGTH && code.split('').all? { |symbol| ALLOWED_SYMBOLS.include?(symbol) }
  end

  def calculate_score(guess, answer)
    score = ''
    wrong_guess_pegs = []
    wrong_answer_pegs = []
    peg_pairs = guess.chars.zip(answer.chars)

    peg_pairs.each do |guess_peg, answer_peg|
      if guess_peg == answer_peg
        score << SCORE_PEGS[:fully]
      else
        wrong_guess_pegs << guess_peg
        wrong_answer_pegs << answer_peg
      end
    end

    wrong_guess_pegs.each do |peg|
      if wrong_answer_pegs.include?(peg)
        wrong_answer_pegs.delete(peg)
        score << SCORE_PEGS[:partly]
      end
    end

    score
  end
end
