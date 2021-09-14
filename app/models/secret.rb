class Secret < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {in: 5..40}
  validates :body, presence: true, length: {in: 5..250}
end
