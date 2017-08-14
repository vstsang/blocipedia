class UsersController < ApplicationController
  before_action :authenticate_user!

  def downgrade
    current_user.standard!
    wiki_to_public
    flash[:notice] = "Sorry to see you downgrade, no refund unfortunately."
    redirect_to edit_user_registration_path
  end

  private
  def wiki_to_public
    current_user.wikis.each do |wiki|
      wiki.private = false
      wiki.save
    end
  end
end
