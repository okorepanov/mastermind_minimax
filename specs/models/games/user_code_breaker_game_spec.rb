# frozen_string_literal: true

require './models/games/user_code_breaker_game'

RSpec.describe Games::UserCodeBreakerGame do
  let(:show_game) { described_class.new }

  it { expect(described_class.ancestors).to include(::Games::BaseGame) }

  describe '#initialize' do
    before { allow_any_instance_of(described_class).to receive(:generate_random_code).and_return('1234') }

    it 'contains appropriate default attributes' do
      expect(show_game.instance_variable_get(:@code)).to eq('1234')
      expect(show_game.instance_variable_get(:@user_result)).to eq('lose')
    end
  end
end
