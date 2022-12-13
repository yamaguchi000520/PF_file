class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|

      t.string :name, null:false
      t.string :introduction, null:false

      t.timestamps
    end
  end
end
