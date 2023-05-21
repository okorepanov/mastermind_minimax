# frozen_string_literal: true

require './modules/game_options'

RSpec.describe GameOptions do
  it { expect(GameOptions::DEFAULT_MAXIMUM_GUESSES).to eq(12) }
  it { expect(GameOptions::CODE_LENGTH).to eq(4) }
  it { expect(GameOptions::ALLOWED_SYMBOLS).to eq('123456') }
  it { expect(GameOptions::SCORE_PEGS).to eq(Hash[fully: 'B', partly: 'W']) }
  it { expect(GameOptions::WIN_SCORE).to eq('BBBB') }
end
