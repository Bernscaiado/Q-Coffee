class Coffee < ApplicationRecord
  has_many :reviews, dependent: :delete_all
  belongs_to :origin
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :farm, :brand, :sensory, :roast, :taste, presence: true
  validates :name, uniqueness: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: { name: 'A', farm: 'C', taste: 'B',
                             brand: 'B', sensory: 'B', roast: 'D' },
                  associated_against: {
                    origin: { name: 'A' }
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :category_search,
                  against: { farm: 'A', taste: 'A',
                             brand: 'D', sensory: 'A', roast: 'B' },
                  associated_against: {
                    origin: { name: 'A' }
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
