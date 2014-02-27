class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.boolean :is_like

      t.timestamps
    end
  end
end
