# frozen_string_literal: true

class GrammarQuestion < ApplicationRecord
  validates :question, :key_answer, presence: true
  belongs_to :lesson
end
