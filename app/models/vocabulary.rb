# frozen_string_literal: true

class Vocabulary < ApplicationRecord
  validates :furigana, :mean, presence: true
  belongs_to :lesson
end
