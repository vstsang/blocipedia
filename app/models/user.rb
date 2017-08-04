class User < ActiveRecord::Base
#  after_create :send_registration_emails

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

#  private

#  def send_registration_emails
#    ConfirmMailer.confirmation_email(self).deliver_now
#  end
end
