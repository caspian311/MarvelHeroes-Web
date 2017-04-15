class CreateApiKeys < ActiveRecord::Migration[5.0]
  def up
    create_table :api_accesses do |t|
      t.string :user_id, null: false
      t.string :api_key, null: false
    end
  end

  def down
    drop_table :api_accesses
  end
end
