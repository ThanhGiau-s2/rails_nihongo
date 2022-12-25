# frozen_string_literal: true

class ResultExamVocabDetail < ApplicationRecord
  validates :response, :result, presence: true
  belongs_to :result_exam_vocab
  belongs_to :vocab_question
end
