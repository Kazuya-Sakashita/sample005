class SkillManagement < ApplicationRecord
  belongs_to :user
  belongs_to :skill, optional: true

  # enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }

  validates :user_id, presence: true
  validates :skill_id, presence: true, uniqueness: { scope: :user } # 重複を保存しない
  validates :skill_level, presence: true
  validates :availability, inclusion: { in: [true, false] }, presence: true
end
