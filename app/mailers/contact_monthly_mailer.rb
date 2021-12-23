class ContactMonthlyMailer < ApplicationMailer
  default to: -> { User.pluck(:email) },
          from: 'notification@example.com'

  def contact_monthly_mail(user)
    @user = user
    mail(subject: "稼働時間入力のお願い")
  end
end
