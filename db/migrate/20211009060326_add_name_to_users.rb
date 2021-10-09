class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :skills, :string
    add_column :users, :skill_level, :integer
    add_column :users, :github_url, :string
    add_column :users, :account_info, :string
    add_column :users, :unit_price, :integer
    add_column :users, :unit, :integer
  end
end
