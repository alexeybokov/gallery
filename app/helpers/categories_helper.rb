module CategoriesHelper
  def top_5_categories
    Category.all.each do |category|
      top_img_counter = 0
      category.images.each { |i| top_img_counter += (i.hearts_count + i.comments_count) }
      category.range_counter = category.images_count + top_img_counter
      category.save!
    end
    Category.all.order(range_counter: :desc).limit(5)
  end
end
