$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/lib/")
require 'customers'
require 'haversine_calculator'
require 'json_file_parser'

customers_file = File.expand_path(File.dirname(__FILE__) + "/customers.json")
customers = Customers.new(customers_file, JsonFileParser.new, HaversineCalculator.new)
print "User Id \t\t Name\n"
customers.within_kms(100).each do |customer|
  print "#{customer['user_id']} \t\t #{customer['name']}\n"
end
