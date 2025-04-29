# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb - Generate 100 fake students for testing
require 'faker'

# Clear existing data
puts "Clearing existing students..."
Student.destroy_all

# New York area codes
ny_area_codes = ['212', '315', '332', '347', '516', '518', '585', '607', '631', '646', '680', '716', '718', '845', '914', '917', '929', '934']

# New York cities
ny_cities = [
  'New York', 'Brooklyn', 'Queens', 'Bronx', 'Staten Island', 'Buffalo', 'Rochester', 
  'Yonkers', 'Syracuse', 'Albany', 'New Rochelle', 'Mount Vernon', 'Schenectady', 
  'Utica', 'White Plains', 'Hempstead', 'Freeport', 'Valley Stream', 'Long Beach', 'Glen Cove'
]

# Create 100 fake students
puts "Creating 100 fake students..."

100.times do |i|
  # Generate a phone number with NY area code
  area_code = ny_area_codes.sample
  phone = "(#{area_code}) #{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}"
  
  # Generate fake student with relevant New York addresses
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: phone,
    address: Faker::Address.street_address,
    city: ny_cities.sample,
    state: 'NY',
    zip_code: Faker::Address.zip_code[0..4],
    
    # Communication preferences (approximately 70% true)
    texts: Faker::Boolean.boolean(true_ratio: 0.7),
    calls: Faker::Boolean.boolean(true_ratio: 0.7),
    
    # Status flags (approximately 30% for internship, 50% for higher ed)
    internship: Faker::Boolean.boolean(true_ratio: 0.3),
    higher_ed: Faker::Boolean.boolean(true_ratio: 0.5),
    
    # Interest areas (varying probabilities)
    climate_change: Faker::Boolean.boolean(true_ratio: 0.4),
    democracy: Faker::Boolean.boolean(true_ratio: 0.3),
    poverty: Faker::Boolean.boolean(true_ratio: 0.45),
    mass_transit: Faker::Boolean.boolean(true_ratio: 0.35),
    consumer: Faker::Boolean.boolean(true_ratio: 0.25)
  )
  
  # Print progress
  if (i + 1) % 10 == 0
    puts "Created #{i + 1} students..."
  end
end

# Summary
puts "Done!"
puts "Created #{Student.count} students"
puts "#{Student.with_internship.count} students with internship interest"
puts "#{Student.with_higher_ed.count} students with higher education interest"
puts "#{Student.contactable_by_text.count} students contactable by text"
puts "#{Student.contactable_by_call.count} students contactable by call"
puts "Interest areas breakdown:"
puts "- Climate Change: #{Student.interested_in_climate_change.count}"
puts "- Democracy: #{Student.interested_in_democracy.count}"
puts "- Poverty: #{Student.interested_in_poverty.count}"
puts "- Mass Transit: #{Student.interested_in_mass_transit.count}"
puts "- Consumer: #{Student.interested_in_consumer.count}"