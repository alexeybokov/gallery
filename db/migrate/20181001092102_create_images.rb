class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
