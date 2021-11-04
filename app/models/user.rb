class User < ApplicationRecord
  has_many :skill_managements
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
  enum skill_level: { Junior: 0, Middle: 1, Senior: 2 }
  enum unit: { hours: 0, days: 1 }
end
