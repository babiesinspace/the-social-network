class Post < ApplicationRecord
  belongs_to :author, class_name: User
  belongs_to :receiver, class_name: User

  validates :body, presence: true, length: {minimum: 10 }
end
