class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :comments, dependent: :destroy
  has_many :gossips
  has_many :tags
  has_many :recipients
  has_many :messages, through: :recipients
  belongs_to :city, optional: true
  has_secure_password      
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :email, presence: true
  def full_name
        "#{first_name} #{last_name}"
      end
      def self.anonymous
        find_by(is_anonymous: true)
      end

end
