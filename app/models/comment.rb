class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image, counter_cache: :comments_count

  validates :body, presence: true
  validates :user, presence: true

  paginates_per 10
end
