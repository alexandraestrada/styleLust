class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.references :category, index: true
      t.references :brand, index: true

      t.timestamps
    end
  end
end
