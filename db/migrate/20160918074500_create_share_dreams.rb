class CreateShareDreams < ActiveRecord::Migration
  def change
    create_table :share_dreams do |t|
      t.string :tittle
      t.text :description

      t.timestamps null: false
    end
  end
end
