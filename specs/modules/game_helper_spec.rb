# frozen_string_literal: true

require './modules/game_helper'

RSpec.describe GameHelper do
  let(:object) { Object.new.extend(described_class) }

  describe '#valid_code?' do
    subject { object.valid_code?(code) }

    context 'when code is valid' do
      let(:code) { '1234' }

      it { is_expected.to eq(true) }
    end

    context 'when code is invalid' do
      let(:code) { '1qw47' }

      it { is_expected.to eq(false) }
    end
  end

  describe '#calculate_score' do
    subject { object.calculate_score(guess, answer) }

    let(:answer) { '6324' }

    context 'when answer doesnt have any right numbers' do
      let(:guess) { '1551' }

      it { is_expected.to eq('') }
    end

    context 'when answer has some right numbers' do
      let(:guess) { '1536' }

      it { is_expected.to eq('WW') }
    end

    context 'when answer has some right numbers on right positions' do
      let(:guess) { '6554' }

      it { is_expected.to eq('BB') }
    end

    context 'when answer has some right numbers with numbers on right positions' do
      let(:guess) { '6234' }

      it { is_expected.to eq('BBWW') }
    end

    context 'when answer is correct' do
      let(:guess) { '6324' }

      it { is_expected.to eq('BBBB') }
    end
  end
end
