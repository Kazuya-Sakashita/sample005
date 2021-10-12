class Management < ApplicationRecord
  enum unit: { hours: 0, days: 1 }
end
