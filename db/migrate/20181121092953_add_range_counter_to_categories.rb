class AddRangeCounterToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :range_counter, :integer, default: 0
  end
end
