# frozen_string_literal: true

# contact model validations and permissions.
class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_categories
  has_many :categories, through: :contact_categories
  has_many :links, dependent: :destroy
  has_one_attached :image

  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  validates :first_name, presence: true,
                        uniqueness: {case_sensitive: false },
                        length: { maximum: 25 }
  validates :last_name, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 25 }
  validates :description, presence: true,
                    length: { maximum: 200 }

  validate :validate_correct_image_type

  before_save { self.first_name = first_name.downcase }
  before_save { self.last_name = last_name.downcase }

  def thumb
    image.variant(resize: '100x100!').processed
  end

  def profile
    image.variant(resize: '400x400!').processed
  end

  def to_param
    first_name
  end

  private

  def validate_correct_image_type
    if image.attached? && !image.content_type.in?(%w[image/jpg image/png])
      errors.add(:image, 'must be JPG or PNG.')
    elsif image.attached? == false
      errors.add(:image, 'required')
    end
  end
end
