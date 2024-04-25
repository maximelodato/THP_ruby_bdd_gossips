class User < ApplicationRecord
    has_many :gossips
    has_many :tags
    has_many :messages
    belongs_to :city, optional: true
end
