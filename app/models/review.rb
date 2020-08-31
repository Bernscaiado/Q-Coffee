class Review < ApplicationRecord
  belongs_to :user
  belongs_to :coffee

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal: 5 }
end
