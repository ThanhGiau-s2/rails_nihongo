# frozen_string_literal: true

class Mp3 < ApplicationRecord
  validates :practice_reading, :listening_exercises, :vocabulary, :conversation, presence: true
  belongs_to :lesson
end
