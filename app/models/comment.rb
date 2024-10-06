class Comment < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :text, presence: true, length: { minimum: 1 }
end
