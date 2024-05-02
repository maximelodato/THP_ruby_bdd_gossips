class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  attribute :author_name, :string
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true
  has_many :comments, dependent: :destroy
  


end
