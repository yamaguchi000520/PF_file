class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|

      t.string :name, null:false
      t.text :introduction

      t.timestamps
    end
  end
end
