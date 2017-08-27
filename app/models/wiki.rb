class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :collaborators
  has_many :users, through: :collaborators
  has_one :owner, dependent: :destroy

  def public?
    self.private == false
  end

end
