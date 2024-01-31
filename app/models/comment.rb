class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :description, length: { maximum: 200 }
end
