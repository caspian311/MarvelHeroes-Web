class CreateUsage < ActiveRecord::Migration[5.0]
  def change
    create_table :usages do |t|
      t.integer :user_id, null: false
      t.string :request, null: false
      t.integer :response, null: false
    end
  end
end
