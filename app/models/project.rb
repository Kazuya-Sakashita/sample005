class Project < ApplicationRecord
  belongs_to :client

  # enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }
  # enum unit: { hours: 0, days: 1 }
end
