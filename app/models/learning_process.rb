# frozen_string_literal: true

class LearningProcess < ApplicationRecord
  validates :date, presence: true
  belongs_to :lesson
  belongs_to :student
end
