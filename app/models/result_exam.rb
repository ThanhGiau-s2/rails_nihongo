# frozen_string_literal: true

class ResultExam < ApplicationRecord
  validates :score, :status, :start_at, :end_at, :finish_at, :date, presence: true
  belongs_to :lesson
  belongs_to :student
end
