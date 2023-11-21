class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  scope :public_articles, -> { where(private: false) }
  has_many :comments
end
