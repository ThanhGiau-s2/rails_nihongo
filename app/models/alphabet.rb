# frozen_string_literal: true

class Alphabet < ApplicationRecord
  CSV_ATTRIBUTES = %w(romaji hiragana katakana classify).freeze
  validates :romaji, :hiragana, :katakana, :classify, presence: true
  attr_accessor :file

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
