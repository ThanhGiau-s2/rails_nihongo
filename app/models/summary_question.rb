# frozen_string_literal: true

class SummaryQuestion < ApplicationRecord
  validates :question, :option_1, :option_2, :option_3, :option_4, :key_answer, presence: true
  belongs_to :lesson
end
