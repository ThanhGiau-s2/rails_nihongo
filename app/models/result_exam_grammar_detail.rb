# frozen_string_literal: true

class ResultExamGrammarDetail < ApplicationRecord
  validates :response, :result, presence: true
  belongs_to :result_exam_grammar
  belongs_to :grammar_question
end
