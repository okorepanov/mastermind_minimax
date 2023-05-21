# # frozen_string_literal: true

require './models/games/base_game'

RSpec.describe Games::BaseGame do
  it { expect(described_class).to include(GameHelper) }

  describe '#get_user_input' do
    subject { described_class.new.send(:get_user_code) }

    before { allow_any_instance_of(Kernel).to receive(:gets).and_return('1234') }

    it { is_expected.to eq('1234') }
  end

  describe '#run' do
    subject { -> { described_class.new.run } }

    it { is_expected.to raise_error(NotImplementedError) }
  end
end
