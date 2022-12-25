# frozen_string_literal: true

class Alphabet < ApplicationRecord
  validates :romaji, :hiragana, :katakana, :classify, presence: true
end
