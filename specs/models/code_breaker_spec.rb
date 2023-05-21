# frozen_string_literal: true

require './models/code_breaker'

RSpec.describe CodeBreaker do
  let(:code_breaker) { described_class.new }

  describe '#initialize' do
    it 'contains appropriate default attributes' do
      expect(code_breaker.instance_variable_get(:@guess_number)).to eq(0)
      expect(code_breaker.instance_variable_get(:@guesses)).to eq(0)
      expect(code_breaker.instance_variable_get(:@score)).to eq('')
      expect(code_breaker.instance_variable_get(:@all_scores)).to be_a(Hash)
      expect(code_breaker.instance_variable_get(:@all_answers)).to be_a(Set)
      expect(code_breaker.instance_variable_get(:@possible_scores)).to be_a(Hash)
      expect(code_breaker.instance_variable_get(:@possible_answers)).to be_a(Set)
    end
  end

  describe '#make_guess' do
    let(:guess) { code_breaker.make_guess }

    context 'when guess_number is 0' do
      before { guess }

      it 'updates guess_number correctly' do
        expect(code_breaker.instance_variable_get(:@guess_number)).to eq(1)
      end

      it 'sets guess to a default value' do
        expect(code_breaker.instance_variable_get(:@guess)).to eq('1122')
      end
    end
  end
end
