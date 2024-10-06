class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :text, presence: true, length: { minimum: 1 }
end
