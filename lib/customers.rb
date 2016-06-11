class Customers
  INTERCOM = {"latitude" => "53.3381985", "longitude" => "-6.2592576"}
  def initialize json_location, parser, haversine_calculator
    @haversine_calculator = haversine_calculator
    @customers = parser.parse_line_by_line json_location
  end

  def all
    @customers
  end

  def within_kms kms
    @customers.select do |customer|
      customer_lives_within_kms? customer, kms
    end
  end

  private
  def customer_lives_within_kms? customer, kms
    @haversine_calculator.distance_between(INTERCOM, customer) <= kms
  end
end
