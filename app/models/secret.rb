class Secret < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true, length: {in: 5..40}
  validates :body, presence: true, length: {in: 5..250}
  

  def self.remove(id)
    find(id).destroy
  end

end
