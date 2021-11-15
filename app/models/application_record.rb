class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  enum unit: { hours: 0, days: 1 }
  enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }
end
