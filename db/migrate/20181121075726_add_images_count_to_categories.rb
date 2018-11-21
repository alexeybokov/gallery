class AddImagesCountToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :images_count, :integer, default: 0
  end
end
