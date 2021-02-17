class Link < ApplicationRecord
    belongs_to :contact, optional: true
end