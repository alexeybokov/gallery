class Heart < ApplicationRecord
  belongs_to :image
  belongs_to :user

  validates :user_id, uniqueness: { scope: :image_id }
end
