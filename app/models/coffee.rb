class Coffee < ApplicationRecord
  has_many :reviews

  validates :name, :origin, :farm, :brand, :sensory, :roast, presence: true
  validates :name, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_all,
                  against: %i[name origin farm brand sensory roast],
                  using: {
                    tsearch: { prefix: true }
                  }
end
