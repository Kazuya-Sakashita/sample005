class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :client, null: false, foreign_key: { to_table: :clients }
      t.string :project_name, null: false
      t.text :project_content, null: false
      t.string :skills
      t.string :skill_level
      t.string :budget

      t.timestamps
    end
  end
end
