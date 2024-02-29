class Column < ApplicationRecord
  belongs_to :user
  has_many :cards
  
  validates :title, presence: true, length: { minimum: 3 }
end
