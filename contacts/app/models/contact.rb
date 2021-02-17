class Contact < ApplicationRecord
    has_many :links, dependent: :destroy
    accepts_nested_attributes_for :links, reject_if: :all_blank
    validates :first_name, presence: true
    validates :last_name, presence: true
end
