# frozen_string_literal: true

class Lesson < ApplicationRecord
  validates :title, :subtitle, presence: true
  validates :title, uniqueness: { allow_blank: true }
end
