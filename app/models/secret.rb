class Secret < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true, length: {in: 5..40}
  validates :body, presence: true, length: {in: 5..250}
end
