class Article < ApplicationRecord
  belongs_to :user

  has_one :player, dependent: :destroy
  accepts_nested_attributes_for :player, update_only: true

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :article_title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 10000 }

  mount_uploader :article_image, ArticleImageUploader
end