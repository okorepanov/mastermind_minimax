# frozen_string_literal: true

require 'rubyXL'

class FileWriter
  FILE_NAME = 'minimax_performance.xlsx'.freeze
  HEADERS = ['Game Number', 'Code', 'Steps', 'Steps Count']
  COLUMNS = {
    game_number: 0,
    code: 1,
    steps: 2,
    steps_count: 3
  }

  def initialize
    @row_index = 0

    write_title
    write_headers
    save_row_to_file
  end

  def save_round(game_number, code, steps, steps_count)
    worksheet.add_cell(@row_index, COLUMNS[:game_number], game_number)
    worksheet.add_cell(@row_index, COLUMNS[:code], code)
    worksheet.add_cell(@row_index, COLUMNS[:steps], steps.join("\n"))
    worksheet.add_cell(@row_index, COLUMNS[:steps_count], steps_count)

    save_row_to_file
  end

  private

  def workbook
    @workbook ||= RubyXL::Workbook.new
  end

  def worksheet
    @worksheet ||= workbook.worksheets[0]
  end

  def write_title
    worksheet.sheet_name = 'Minimax Performance'
  end

  def write_headers
    HEADERS.each_with_index do |header, index|
      worksheet.add_cell(@row_index, index, header)
    end
  end

  def save_row_to_file
    workbook.write(FILE_NAME)

    @row_index += 1
  end
end
