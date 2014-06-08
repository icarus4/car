class CarBrand < ActiveRecord::Base

  has_many :cars

  validates :brand, presence: true, uniqueness: true
            inclusion: { %w(BMW
                            Ford
                            Honda Hyundai
                            Infiniti
                            Lexus
                            M-Benz Mazda Mitsubishi
                            Nissan
                            Peugeot
                            Skoda Subaru Suzuki
                            Tobe Toyota
                            Volkswagen Volvo) }

end
