class Skill < ApplicationRecord
  has_many :skill_managements
  has_many :users, through: :skill_managements

  validates :skill, uniqueness: true

  enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }

end
