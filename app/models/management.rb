class Management < ApplicationRecord
  belongs_to :wage

  enum unit: { hours: 0, days: 1 }
end
