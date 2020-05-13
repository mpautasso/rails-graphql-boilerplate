# frozen_string_literal: true

class User < ApplicationRecord
  # == Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  # == Associations
  has_many :posts, dependent: :destroy
end
