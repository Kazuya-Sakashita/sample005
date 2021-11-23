class AddAasmStateToManagements < ActiveRecord::Migration[6.1]
  def change
    add_column :managements, :management_state, :string
  end
end
