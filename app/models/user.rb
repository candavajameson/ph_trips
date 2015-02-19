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

   mount_uploader :avatar, AvatarUploader

   def is_admin?
   		admin
   end
   
end
