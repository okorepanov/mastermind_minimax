# frozen_string_literal: true

require './models/games/show_game'

RSpec.describe Games::ShowGame do
  let(:show_game) { described_class.new }

  it { expect(described_class.ancestors).to include(::Games::BaseGame) }

  describe '#initialize' do
    before { allow_any_instance_of(described_class).to receive(:generate_random_code).and_return('1234') }

    it 'contains appropriate default attributes' do
      expect(show_game.instance_variable_get(:@computer_win)).to eq(false)
      expect(show_game.instance_variable_get(:@steps)).to eq([])
      expect(show_game.instance_variable_get(:@game_number)).to eq(0)
      expect(show_game.instance_variable_get(:@code)).to eq('1234')
      expect(show_game.instance_variable_get(:@code_breaker)).to be_a(CodeBreaker)
    end
  end
end
