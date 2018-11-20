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

  scope :by_images, -> { joins(:images).group(:category_id).order(images: :desc) }

  # def by_images_count
  #   Category.joins(images).group(category_id).order(images)
  # end

  # scope :by_images_count, -> do
  #   select <<~SQL
  #     (
  #       SELECT title FROM categories
  #       JOIN images ON images.category_id = categories.id
  #       GROUP BY categories.id
  #       ORDER BY COUNT(category_id) DESC
  #     )
  #   SQL
  # end
  #

  private

  def should_generate_new_friendly_id?
    slug.nil? || title_changed? || location_changed?
  end
end
