class Wage < ApplicationRecord
  belongs_to :user
  has_many :managements
  # enum unit: { hours: 0, days: 1 }


end
