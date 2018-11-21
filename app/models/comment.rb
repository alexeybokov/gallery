class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :image, dependent: :destroy, counter_cache: :comments_count

  validates :body, presence: true
  validates :user, presence: true

  paginates_per 10
end
