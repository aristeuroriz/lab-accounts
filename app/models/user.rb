class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and  ,
  # :rememberable, :trackable,
  devise :database_authenticatable, :recoverable, :validatable,
  :registerable, :omniauthable

  after_create :update_access_token!

  validates :name, presence: true
  validates :email, presence: true


  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end


end
