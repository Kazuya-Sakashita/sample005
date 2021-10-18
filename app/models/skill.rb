class Skill < ApplicationRecord

    with_options presence: true do
        validates :user_id
        validates :skill_id
        validates :skill_level
        validates :availability, inclusion: { in: [true, false] }
    end
end
