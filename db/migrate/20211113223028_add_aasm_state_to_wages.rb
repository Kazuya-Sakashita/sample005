class AddAasmStateToWages < ActiveRecord::Migration[6.1]
  def change
    add_column :wages, :aasm_state, :string
  end
end
