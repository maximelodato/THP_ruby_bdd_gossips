class RecipientMessage < ApplicationRecord
    belongs_to :message
    belongs_to :recipient
end
