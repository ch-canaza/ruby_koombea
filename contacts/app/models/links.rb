class Links < ApplicationRecord
    belongs_to :contact, optional: true
end