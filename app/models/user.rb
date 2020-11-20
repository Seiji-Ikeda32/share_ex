class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shares, dependent: :destroy
  
  def my_post?(share)
    self.id == share.user_id
  end
  
  def self.guest
    find_or_create_by!(email: 'guest_user@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
