# frozen_string_literal: true

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  enum status: { "Active" => 0, "Inactive" => 1, "Pending" => 2, "Blocked" => 3, "Deleted" => 4 }
end
