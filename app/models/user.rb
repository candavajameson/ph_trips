class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :blogs
   has_many :forum_threads
   has_many :forum_posts
   has_many :hotels
   has_many :guides
   has_many :comments

   mount_uploader :avatar, AvatarUploader

   before_save :ensure_authentication_token

   def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
   end

   def is_admin?
   		admin
   end

   private
   def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
   end
  
end
