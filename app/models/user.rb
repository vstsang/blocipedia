class User < ActiveRecord::Base
  has_many :collaborators
  has_many :wikis, through: :collaborators
  has_many :owners

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize :init

  def init
    self.role ||= :standard
  end

  enum role: [:standard, :premium, :admin]
end
