class AddMarvelApiCredsToApiAccess < ActiveRecord::Migration[5.0]
  def change
    add_column :api_accesses, 'public_key', :string, null: false
    add_column :api_accesses, 'private_key', :string, null: false
  end
end
