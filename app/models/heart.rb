class Heart < ApplicationRecord
  belongs_to :image, counter_cache: :hearts_count
  belongs_to :user

  validates :user_id, uniqueness: { scope: :image_id }
end
