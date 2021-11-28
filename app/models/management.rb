class Management < ApplicationRecord
  include AASM

  belongs_to :wage, optional: true
  belongs_to :user

  # enum unit: { hours: 0, days: 1 }

  aasm column: :management_state, timestamps: true do
    state :request, initial: true # 申請
    state :approval # 承認

    event :approval do
      transitions from: :request, to: :approval
    end

    event :request do
      transitions from: :approval, to: :request
    end
  end
end
