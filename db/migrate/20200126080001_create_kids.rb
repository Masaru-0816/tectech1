class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.string :class, null: false
      t.timestamps
    end
  end
end
