# frozen_string_literal: true

require './models/file_writer'

RSpec.describe FileWriter do
  let(:file_writer) { described_class.new }
  let(:workbook) { file_writer.send(:workbook) }
  let(:worksheet) { workbook.worksheets[0] }
  let(:header_cells) { worksheet.sheet_data[0].cells }

  before { allow(described_class).to receive(:save_row_to_file) }

  it { expect(FileWriter::FILE_NAME).to eq('minimax_performance.xlsx')  }
  it { expect(FileWriter::HEADERS).to eq(['Game Number', 'Code', 'Steps', 'Steps Count'])  }
  it { expect(FileWriter::COLUMNS).to eq(Hash[game_number: 0, code: 1, steps: 2, steps_count: 3])  }
  it { expect(worksheet.sheet_name).to eq('Minimax Performance') }

  it 'sets right headers' do
    expect(header_cells[0].value).to eq('Game Number')
    expect(header_cells[1].value).to eq('Code')
    expect(header_cells[2].value).to eq('Steps')
    expect(header_cells[3].value).to eq('Steps Count')
  end

  describe '#save_round' do
    subject { -> { file_writer.save_round(game_number, code, steps, steps_count) } }

    let(:game_number) { 1 }
    let(:code) { '4321' }
    let(:steps) { %w[1234 4321] }
    let(:steps_count) { 2 }
    let(:row_cells) { worksheet.sheet_data[1].cells }

    it 'sets right values' do
      subject.call

      expect(row_cells[0].value).to eq(1)
      expect(row_cells[1].value).to eq('4321')
      expect(row_cells[2].value).to eq("1234\n4321")
      expect(row_cells[3].value).to eq(2)
    end
  end
end
