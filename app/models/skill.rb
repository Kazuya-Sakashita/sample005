class Skill < ApplicationRecord

    with_options presence: true do
        validates :user_id
        validates :skill_id
        validates :skill_level
        validates :availability, inclusion: { in: [true, false] }
    end

    enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }
end
