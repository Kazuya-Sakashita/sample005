class AddAasmStateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account_state, :string
  end
end
