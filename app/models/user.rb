class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :timeoutable, :confirmable,
  :recoverable, :rememberable, :validatable #:omniauthable,
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, UserUploader
  before_validation { email.downcase! }
  validates :name,  presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 60 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
