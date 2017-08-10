class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    current_user.standard!
    flash[:notice] = "Sorry to see you downgrade, no refund unfortunately."
    redirect_to edit_user_registration_path
  end
end
