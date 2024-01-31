class Column < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cards

  validates :title, presence: true, length: { minimum: 3 }
end
