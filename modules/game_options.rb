module GameOptions
  DEFAULT_MAXIMUM_GUESSES = 12
  CODE_LENGTH = 4
  ALLOWED_SYMBOLS = '123456'.freeze
  SCORE_PEGS = {
    fully: 'B',
    partly: 'W'
  }.freeze
  WIN_SCORE = SCORE_PEGS[:fully] * CODE_LENGTH
end
