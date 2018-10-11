class CreateHearts < ActiveRecord::Migration[5.2]
  def change
    create_table :hearts do |t|
      t.belongs_to :image, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
      t.timestamps
    end
  end
end
