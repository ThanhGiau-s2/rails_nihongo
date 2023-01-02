# frozen_string_literal: true

class Conversation < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :lesson
end
