# frozen_string_literal: true

class Grammar < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :lesson
end
