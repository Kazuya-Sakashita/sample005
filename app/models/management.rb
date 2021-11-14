class Management < ApplicationRecord
  belongs_to :wage, optional: true
  belongs_to :user

  # enum unit: { hours: 0, days: 1 }
end
