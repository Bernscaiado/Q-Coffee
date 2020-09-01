class Like < ApplicationRecord
  belongs_to :coffee
  belongs_to :user

  scope :search, lambda { |coffee_id, user_id|
                   where('coffee_id = ? AND user_id = ? ',
                         coffee_id, user_id).take
                 }
end
