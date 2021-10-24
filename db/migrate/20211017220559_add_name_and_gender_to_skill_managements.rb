class AddNameAndGenderToSkillManagements < ActiveRecord::Migration[6.1]
  def change
    add_column :skill_managements, :availability, :boolean
  end
end
