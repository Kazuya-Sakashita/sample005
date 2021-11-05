class Wage < ApplicationRecord
  belongs_to :user

  enum unit: { hours: 0, days: 1 }
end
