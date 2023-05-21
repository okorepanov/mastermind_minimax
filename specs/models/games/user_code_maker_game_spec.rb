# frozen_string_literal: true

require './models/games/user_code_maker_game'

RSpec.describe Games::UserCodeMakerGame do
  let(:show_game) { described_class.new }

  before do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('1234')
    allow_any_instance_of(Kernel).to receive(:print).and_return('')
  end

  it { expect(described_class.ancestors).to include(::Games::BaseGame) }

  describe '#initialize' do
    it 'contains appropriate default attributes' do
      expect(show_game.instance_variable_get(:@code)).to eq('1234')
      expect(show_game.instance_variable_get(:@user_result)).to eq('win')
      expect(show_game.instance_variable_get(:@code_breaker)).to be_a(CodeBreaker)
    end
  end
end
