# frozen_string_literal: true

class PracticeListening < ApplicationRecord
  validates :part, :mp3, presence: true
  belongs_to :lesson
end
