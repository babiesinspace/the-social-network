class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, foreign_key: :author_id
  has_many :received_posts, class_name: Post, foreign_key: :receiver_id
  # has_and_belongs_to_many :friends,
  #                         :class_name => "User",
  #                         :join_table => "friendships",
  #                         :foreign_key => "user_1_id",
  #                         :association_foreign_key => "user_2_id"

  has_many :friendships, foreign_key: :user_1_id
  has_many :friends, through: :friendships, source: :user_2

  has_many :inverse_friendships, class_name: Friendship, foreign_key: :user_2_id

  has_many :inverse_friends, through: :inverse_friendships, source: :user_1

  has_many :sent_requests, class_name: FriendRequest, foreign_key: :requester_id
  has_many :received_requests, class_name: FriendRequest, foreign_key: :receiver_id

  def add_friend(friend)
    self.friends << friend unless self.friends.include?(friend) || friend == self
  end

  def all_friends
    (self.friends + self.inverse_friends).uniq
  end

  def request_friend(friend)
    @request = FriendRequest.new(requester: self, receiver: friend)
    if @request.save
      "Request sent"
    else
      "Problem with request"
    end
  end
end
