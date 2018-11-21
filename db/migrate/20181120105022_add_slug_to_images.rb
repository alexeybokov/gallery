class AddSlugToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :slug, :string
  end
end
