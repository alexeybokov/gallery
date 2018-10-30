class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :body, presence: true
  validates :user, presence: true
end
