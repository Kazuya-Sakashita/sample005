class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :github_url, :string
    add_column :users, :account_info, :string
    add_column :users, :role, :integer, default: 0
  end
end
