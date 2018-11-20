class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_categories
  before_action :newest
  # before_action :by_images_count


  private

  def init_categories
    @categories = Category.order(:title).limit(5)
  end

  def newest
    @new_category = Category.newest.limit(5)
  end

  # def by_images_count
  #   @top_category = Category.find_by_sql("
  #     SELECT title, title.id FROM categories
  #     JOIN images ON images.category_id = categories.id
  #     GROUP BY categories.id
  #     ORDER BY COUNT(category_id) DESC
  #     LIMIT 5
  #   ")
  # end

  def by_images_count
    @top_category = Category.images.limit(5)
  end
end
