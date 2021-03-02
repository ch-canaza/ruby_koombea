# frozen_string_literal: true

# user model validations and permissions
class User < ApplicationRecord
  has_one_attached :user_image
  has_many :contact, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USER_NAME_REGEX = /\A[A-Za-z0-9]+\Z/
  validates :email, presence: true,
                  uniqueness: { case_sensitive: false},
                  length: { minimum: 3, maximum: 25 },
                  format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true,
                  uniqueness: { case_sensitive: false},
                  length: { minimum: 3, maximum: 50 }
  validates :user_name, presence: true,
                  uniqueness: { case_sensitive: false},
                  length: { minimum: 3, maximum: 25 },
                  format: { with: VALID_USER_NAME_REGEX }
  validates :description, presence: true,
                  length: { maximum: 200 }

before_save { self.email = email.downcase }

  has_secure_password

  def to_param
    name
  end
end
