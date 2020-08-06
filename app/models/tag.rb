class Tag < ApplicationRecord
  has_many :taggings
  has_many :tag_posts, through: :taggings, source: :post
end
