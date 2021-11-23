class AddAasmStateToManagements < ActiveRecord::Migration[6.1]
  def change
    add_column :managements, :aasm_state, :string
  end
end
