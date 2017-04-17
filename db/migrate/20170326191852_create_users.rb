class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
    end

    add_index :users, :email, unique: true
  end

  def down
    drop_table :users
  end
end
