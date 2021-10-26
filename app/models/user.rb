class User < ApplicationRecord

  has_many :publications
  has_secure_password

  mount_uploader :image, ImageUploader

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
end
