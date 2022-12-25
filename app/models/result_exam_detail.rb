# frozen_string_literal: true

class ResultExamDetail < ApplicationRecord
  validates :response, :result, presence: true
  belongs_to :result_exam
  belongs_to :summary_question
end
