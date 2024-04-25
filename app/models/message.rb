class Message < ApplicationRecord
    belongs_to :user
    has_many :recipient_messages
    has_many :recipients, through: :recipient_messages
end
