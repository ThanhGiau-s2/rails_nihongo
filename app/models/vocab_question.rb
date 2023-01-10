# frozen_string_literal: true

class VocabQuestion < ApplicationRecord
  CSV_ATTRIBUTES = %w(lesson_id question option_1 option_2 option_3 option_4 key_answer).freeze
  validates :question, :option_1, :option_2, :option_3, :option_4, :key_answer, presence: true
  belongs_to :lesson
  class << self
    def import_file file
      spreadsheet = Roo::Spreadsheet.open file
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|
        row = [header, spreadsheet.row(i)].transpose.to_h
        create! row
      end
    end
  end
end
