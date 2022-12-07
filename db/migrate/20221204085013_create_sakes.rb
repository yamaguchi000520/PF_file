class CreateSakes < ActiveRecord::Migration[6.1]
  def change
    create_table :sakes do |t|

      t.integer :customer_id, null:false
      t.integer :genre_id, null:false
      t.integer :tag_id
      t.string :name, null:false
      t.string :introduction, null:false
      t.string :price, null:false
      t.string :evaluation, null:false

      t.timestamps
    end
  end
end
