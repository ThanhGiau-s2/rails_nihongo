# frozen_string_literal: true

class PracticeReading < ApplicationRecord
  validates :content, presence: true
  belongs_to :lesson
end
