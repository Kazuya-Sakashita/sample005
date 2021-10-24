class SkillManagement < ApplicationRecord
  belongs_to :user
  belongs_to :skill, optional: true

  enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }
end
