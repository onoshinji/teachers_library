class Post < ApplicationRecord

  validates :grade, presence: true
  validates :subject, presence: true
  validates :unit, presence: true
  #検索機能のためのscope
  # ファイルの種類はページ遷移時に取得するので、type_searchは使用しなくなった
  # scope :type_search, -> (type_search) { where(type: type_search)}
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
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  #imageダウンロードに関連したメソッドの定義
  # file_name => image_name
  def image_name
    self.image.file
  end
  # content_type => image_type
  def image_type
    self.image.content_type
  end

  #ms_officeダウンロードに関連したメソッドの定義
  def file_name
    self.ms_office.file
  end
  def file_type
    self.ms_office.content_type
  end
  #
  mount_uploader :ms_office, ExcelAndWordUploader
  mount_uploader :image, ImageUploader
  # enum集
  enum grade: { １年生: 1, ２年生: 2, ３年生: 3, ４年生: 4, ５年生: 5, ６年生: 6, 特別支援: 7, 学年共通: 8,}
  enum subject: { 国語: 1, 社会: 2, 算数: 3, 理科: 4, 生活: 5,
                  音楽: 6 , 図画工作: 7, 家庭: 8, 体育: 9,
                  道徳: 10, 総合: 11, 特別活動: 12, 外国語活動: 13}
  # enum kind: {ワークシート: 1, 指導案: 2}
end
