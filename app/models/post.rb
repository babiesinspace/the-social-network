class Post < ApplicationRecord
  belongs_to :author, class_name: User
  belongs_to :receiver, class_name: User

  validates :body, presence: true, length: {minimum: 10 }

  def user_authorized?
    current_user == self.author || current_user == self.receiver
  end
end
