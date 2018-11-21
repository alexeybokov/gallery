class AddHeartsCountToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :hearts_count, :integer, default: 0
  end
end
