class Post < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 2000 }
  validates :image, presence: true
  validates :grade, presence: true
  validates :subject, presence: true
  validates :unit, presence: true
  belongs_to :user
  # タグ機能
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  belongs_to :user
  enum grade: { １年生: 1, ２年生: 2, ３年生: 3, ４年生: 4, ５年生: 5, ６年生: 6, 特別支援: 7,}
  enum subject: { 国語: 1, 社会: 2, 算数: 3, 理科: 4, 生活: 5,
                  音楽: 6 , 図画工作: 7, 家庭: 8, 体育: 9,
                  道徳: 10, 総合: 11, 特別活動: 12, 外国語活動: 13}
end
