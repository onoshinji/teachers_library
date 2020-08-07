class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tag_posts, through: :taggings, source: :post
end
