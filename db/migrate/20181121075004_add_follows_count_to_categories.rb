class AddFollowsCountToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :follows_count, :integer, default: 0
  end
end
