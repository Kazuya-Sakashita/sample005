class CreateManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :managements do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :project, null: false, default: 0
      t.integer :uptime
      t.integer :unit_cost
      t.integer :unit
      t.string :date
      t.timestamps
    end
  end
end
