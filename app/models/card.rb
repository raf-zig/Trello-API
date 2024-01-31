class Card < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :columns

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { maximum: 200 }
end
