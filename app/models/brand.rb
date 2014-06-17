class Brand < ActiveRecord::Base

  has_many :cars

  validates :name, presence: true, uniqueness: true,
            inclusion: { in: %w(BMW
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

  validates :headquarters, allow_nil: true,
            inclusion: { in: %w(Japan
                                Taiwan
                                U.S.) }
end
