class CreateSkillManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_managements do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :skill_id, null: false
      t.integer :skill_level, null: false

      t.timestamps
    end
  end
end
