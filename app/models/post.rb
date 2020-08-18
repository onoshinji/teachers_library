class Post < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 2000 }
  # validates :image, presence: true
  validates :grade, presence: true
  validates :subject, presence: true
  validates :unit, presence: true
  #検索機能のためのscope
  scope :grade_search, -> (type_search) { where(type: type_search)}
  scope :grade_search, -> (grade_search) { where(grade: grade_search)}
  scope :subject_search, -> (subject_search) { where(subject: subject_search)}
  scope :unit_search, -> (unit_search) { where('unit LIKE ?',"%#{(unit_search)}%")}
  belongs_to :user
  # タグ機能
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # お気に入り機能
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  # いいね機能

  #ダウンロードに関連したメソッドの定義

  def file_name
    self.image.file.filename
  end

  def content_type
    self.image.content_type
  end

  def file_url
    "https://54.150.129.112#{self.file_name}"
  end

  mount_uploader :ms_office, ExcelAndWordUploader
  mount_uploader :image, ImageUploader
  # enum集
  enum grade: { １年生: 1, ２年生: 2, ３年生: 3, ４年生: 4, ５年生: 5, ６年生: 6, 特別支援: 7,}
  enum subject: { 国語: 1, 社会: 2, 算数: 3, 理科: 4, 生活: 5,
                  音楽: 6 , 図画工作: 7, 家庭: 8, 体育: 9,
                  道徳: 10, 総合: 11, 特別活動: 12, 外国語活動: 13}
  enum kind: {ワークシート: 1, 指導案: 2, 所見例: 3,}
end
