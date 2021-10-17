class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :staff
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
