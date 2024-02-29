class Card < ApplicationRecord
  belongs_to :user
  belongs_to :columns
  has_many :comments
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { maximum: 200 }
end
