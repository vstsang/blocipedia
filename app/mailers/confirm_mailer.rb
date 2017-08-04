class ConfirmMailer < ApplicationMailer
  default from: "vstsang@gmail.com"

  def confirmation_email(user)
    @user = user

    mail(to: user.email, subject: "Registration confirmation for Blocipedia")
  end
end
