class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :blogs
   has_many :forum_threads
   has_many :forum_posts

   mount_uploader :avatar, AvatarUploader
end
