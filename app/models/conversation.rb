# frozen_string_literal: true

class Conversation < ApplicationRecord
  CSV_ATTRIBUTES = %w(lesson_id title content).freeze
  validates :title, :content, presence: true
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
