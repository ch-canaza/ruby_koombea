# frozen_string_literal: true

# user model validations and permissions
class User < ApplicationRecord
  has_one_attached :user_image
  has_many :contact, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                  uniqueness: { case_sensitive: false},
                  length: { minimum: 3, maximum: 25 },
                  format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  length: { minimum: 3, maximum: 25 }

  before_save { self.email = email.downcase }

  has_secure_password
end
