# frozen_string_literal: true

# category model validations and permissions.
class Category < ApplicationRecord
  has_many :contact_categories
  has_many :contacts, through: :contact_categories

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
