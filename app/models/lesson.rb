# frozen_string_literal: true

class Lesson < ApplicationRecord
  CSV_ATTRIBUTES = %w(title subtitle).freeze
  validates :title, :subtitle, presence: true
  validates :title, uniqueness: { allow_blank: true }
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
