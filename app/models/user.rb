class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, :confirmable,
         :recoverable, :rememberable, :validatable #:omniauthable,
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  before_validation { email.downcase! }
  validates :name,  presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 60 },
          format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
