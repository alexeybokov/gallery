class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :body, presence: true, allow_blank: false
end
