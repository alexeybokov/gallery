# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId

  has_many :images, dependent: :destroy
  belongs_to :user
  # belongs_to :image, optional: true

  validates :title, presence: true

  friendly_id :title, use: :slugged

  acts_as_followable

  paginates_per 12

  scope :newest, -> { order(created_at: :desc) }
end
