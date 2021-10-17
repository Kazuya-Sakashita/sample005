class ChangeDataSkillLevelToProject < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :skill_level, :integer
  end
end
