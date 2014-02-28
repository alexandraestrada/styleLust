class AddClickUrlToItem < ActiveRecord::Migration
  def change
    add_column :items, :click_url, :string
  end
end
