class Car < ActiveRecord::Base

  belongs_to :brands

  validates :brand_id, presence: true
  validates :model, presence: true
  validates :submodel, presence: true
  validates :made_in, presence: true, inclusion: { in: %w(Taiwan Japan U.S. India) }
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }
  validates_uniqueness_of :submodel, scope: [:model, :made_in, :year]

end
