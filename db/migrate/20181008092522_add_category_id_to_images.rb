class AddCategoryIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :category_id, :integer
  end
end
