class Car < ActiveRecord::Base

  belongs_to :brand

  validates :brand_id, presence: true
  validates :model, presence: true
  validates :submodel, presence: true
  validates :displacement, presence: true
  validates :made_in, presence: true, inclusion: { in: %w(Taiwan Japan U.S. India) }
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }
  validates_uniqueness_of :submodel, scope: [:model, :made_in, :year, :displacement]
  validates :retail_price, numericality: { greater_than: 0 }

end
