# frozen_string_literal: true

# link model validations and permissions
class Link < ApplicationRecord
  belongs_to :contact, optional: true
end
