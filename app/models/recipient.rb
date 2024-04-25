class Recipient < ApplicationRecord
    has_many :recipient_messages
    has_many :messages, through: :recipient_messages
end
