class LettersController < ApplicationController
  def index
    @post = current_user
    if ContactMonthlyMailer.contact_monthly_mail(@user).deliver_later
      flash[:notice] = 'メール配信できました'
    else
      flash[:alert] = 'メール配信できませんでした！'
    end
    redirect_to managements_path
  end
end
