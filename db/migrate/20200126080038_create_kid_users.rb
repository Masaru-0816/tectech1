class CreateKidUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :kid_users do |t|
      t.references :kid, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
