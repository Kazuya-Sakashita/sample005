class CreateWages < ActiveRecord::Migration[6.1]
  def change
    create_table :wages do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :unit_price, null: false, default: 0
      t.integer :unit, null: false, default: 0

      t.timestamps
    end
  end
end
