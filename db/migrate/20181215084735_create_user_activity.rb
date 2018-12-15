class CreateUserActivity < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer     :user_id
      t.string      :action, null: false
      t.string      :url, null: false

      t.timestamps
    end
  end
end
