class Coffee < ApplicationRecord
  has_many :reviews, dependent: :delete_all
  belongs_to :origin
  belongs_to :user

  validates :name, :origin, :farm, :brand, :sensory, :roast, presence: true
  validates :name, uniqueness: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: { name: 'A', origin: 'C', farm: 'C',
                             brand: 'B', sensory: 'B', roast: 'D' },
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :category_search,
                  against: { origin: 'B', farm: 'A',
                             brand: 'D', sensory: 'A', roast: 'B' },
                  using: {
                    tsearch: { prefix: true }
                  }
end
