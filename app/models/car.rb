class Car < ActiveRecord::Base

  belongs_to :brand

  validates :brand_id, presence: true
  validates :model, presence: true
  validates :submodel, presence: true
  validates :displacement, presence: true
  validates :made_in, presence: true, inclusion: { in: %w(Taiwan Japan U.S. India) }
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }
  validates :retail_price, allow_nil: true, numericality: { greater_than: 0 }

  validates_uniqueness_of :submodel, scope: [:model, :made_in, :year, :displacement], case_sensitive: false
  validates_uniqueness_of :model, scope: [:submodel, :made_in, :year, :displacement], case_sensitive: false
  validates_uniqueness_of :made_in, scope: [:submodel, :model, :year, :displacement], case_sensitive: false
  validates_uniqueness_of :year, scope: [:submodel, :model, :made_in, :displacement], case_sensitive: false
  validates_uniqueness_of :displacement, scope: [:submodel, :model, :year, :made_in], case_sensitive: false

end
