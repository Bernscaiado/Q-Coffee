class ReviewLike < ApplicationRecord
  belongs_to :user
  belongs_to :review

  has_one :coffee, through: :review

  scope :search, lambda { |review_id, user_id|
                   where('review_id = ? AND user_id = ? ',
                         review_id, user_id).take
                 }
end
