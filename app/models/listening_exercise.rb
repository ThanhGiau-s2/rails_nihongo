# frozen_string_literal: true

class ListeningExercise < ApplicationRecord
  validates :content, :part, presence: true
  belongs_to :lesson
end
