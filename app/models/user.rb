class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_and_belongs_to_many :friends,
                          :class_name => "User",
                          :join_table => "friendships",
                          :foreign_key => "user_1_id",
                          :association_foreign_key => "user_2_id"



  def add_friend(friend)
    self.friends << friend unless self.friends.include?(friend) || friend == self
  end
end
