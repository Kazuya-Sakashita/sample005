class User < ApplicationRecord
  include AASM

  aasm do # default column: aasm_state
    state :sleeping, initial: true
    state :running

    event :run do
      transitions from: :sleeping, to: :running
    end

    event :sleep do
      transitions from: :running, to: :sleeping
    end
  end

  has_many :skill_managements
  has_many :managements
  has_many :skills, through: :skill_managements
  has_one :wage
  # has_many :skills, through: :skill_management
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  # roleを設定
  enum role: { general: 0, admin: 1 }
  # enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }
  # enum unit: { hours: 0, days: 1 }

  validates :email, presence: true, uniqueness: true,
                    length: { minimum: 3, maximum: 30 }
  validates :name, length: { maximum: 50 }

  aasm do # default column: aasm_state
    state :active, initial: true
    state :suspended #凍結
    state :banned #BAN
    state :inactive #退会


    event :active do
      transitions from: :suspended, to: :active
    end

    event :suspended do
      transitions from: :active, to: :suspended
    end

    event :ban do
     transitions from: [:active, :suspended], to: :banned
   end

   event :ban do
     transitions from: [:active, :suspended], to: :inactive
   end
  end
end
