#User
User.create(
  email: "ironbuild.mail@gmail.com",
  name: "IronBuild ltd",
  address: "123 Fake st", 
  zip_code: 67292, 
  city: "London", 
  state: "England",
  country: "United Kingdom",
  phone_number_1: 7651890,
  phone_number_2: 3282678,
  fax_number: 980098,
  web_page: "wwww.ironbuild.com",  
  password: 123456,
  password_confirmation: 123456,
  )
puts "User created!"

#Works
Work.create(
  user_id: 1,
  code: "H67",
  name: "Greenwich Hospital",
  address: "34 Greenwich rd", 
  zip_code: 46546, 
  city: "London", 
  state: "England",
  country: "United Kingdom",
  client: "London community",
  client_phone: 354536,
  client_email: "lon_townhall@mail.com",
  client_address: "12 London Bridge st",
  )
puts "Work created!"

Work.create(
  user_id: 1,
  code: "M89",
  name: "Glasgow School",
  address: "Wall st", 
  zip_code: 64332, 
  city: "Glasgow", 
  state: "Scotland",
  country: "United Kingdom",
  client: "Paul Simons",
  client_phone: 2425245,
  client_email: "paul_sim@mail.com",
  client_address: "34 Harbour st",
  )
puts "Work created!"

Work.create(
  user_id: 1,
  code: "A09T",
  name: "Oxford Residence",
  address: "Kings sq", 
  zip_code: 54564, 
  city: "Oxford", 
  state: "England",
  country: "United Kingdom",
  client: "John Smith",
  client_phone: 5432654,
  client_email: "john_oxford@mail.com",
  client_address: "714 Queen Mary st",
  )
puts "Work created!"

#Suppliers
Supplier.create(
  user_id: 1,
  name: "Lndpipes", 
  guild: "plumbing",
  email: "lndpipes@mail.com", 
  address: "323 River st", 
  zip_code: 35325, 
  city: "London", 
  state: "England",
  country: "United Kingdom",
  phone_number_1: 325353,
  phone_number_2: 234255,
  fax_number: 435353,
  web_page: "wwww.lndpipes.com",
  )
puts "Supplier created!"

Supplier.create(
  user_id: 1,
  name: "Electimes", 
  guild: "electrical",
  email: "electimes@mail.com", 
  address: "65 Sun st", 
  zip_code: 36456, 
  city: "London", 
  state: "England",
  country: "United Kingdom",
  phone_number_1: 3634353,
  phone_number_2: 8970753,
  fax_number: 23424,
  web_page: "wwww.electimes.com",
  )
puts "Supplier created!"

Supplier.create(
  user_id: 1,
  name: "Brickers", 
  guild: "masonry",
  email: "brickers@mail.com", 
  address: "91 Rock st", 
  zip_code: 5446, 
  city: "London", 
  state: "England",
  country: "United Kingdom",
  phone_number_1: 654464,
  phone_number_2: 249908,
  fax_number: 30797,
  web_page: "wwww.brickers.com",
  )
puts "Supplier created!"

#Fixes
Fix.create(
  work_id: 1,
  supplier_id: 1,
  code: 123,
  localization: "kitchen",
  comment: "The sin lost water",
  )
puts "Fix created!"

Fix.create(
  work_id: 1,
  supplier_id: 2,
  code: 123,
  localization: "hall",
  comment: "light doesnt work",
  )
puts "Fix created!"

Fix.create(
  work_id: 1,
  supplier_id: 3,
  code: 123,
  localization: "balcony",
  comment: "wrong color of bricks",
  )
puts "Fix created!"

Fix.create(
  work_id: 2,
  supplier_id: 1,
  code: 123,
  localization: "kitchen",
  comment: "The sin lost water",
  )
puts "Fix created!"

Fix.create(
  work_id: 2,
  supplier_id: 2,
  code: 123,
  localization: "hall",
  comment: "light doesnt work",
  )
puts "Fix created!"

Fix.create(
  work_id: 2,
  supplier_id: 3,
  code: 123,
  localization: "balcony",
  comment: "wrong color of bricks",
  )
puts "Fix created!"

#Suppliers reviews for first supplier
SupplierReview.create(
  work_id: 1,
  supplier_id: 1,
  projected_budget: 40000, 
  final_budget: 41000,
  user_valoration: 8,
  )
puts "Review created!"

SupplierReview.create(
  work_id: 1,
  supplier_id: 1,
  projected_budget: 50000, 
  final_budget: 53000,
  user_valoration: 6,
  )
puts "Review created!"

SupplierReview.create(
  work_id: 1,
  supplier_id: 1,
  projected_budget: 30000, 
  final_budget: 29000,
  user_valoration: 9,
  )
puts "Review created!"


# #Seed users
# 1.times do
#   User.create(
#     email: Faker::Internet.email, 
#     name: Faker::Company.name, 
#     address: Faker::Address.street_address, 
#     zip_code: Faker::Address.zip_code, 
#     city: Faker::Address.city, 
#     state: Faker::Address.state,
#     country: Faker::Address.country,
#     phone_number_1: Faker::PhoneNumber.phone_number,
#     phone_number_2: Faker::PhoneNumber.cell_phone,
#     fax_number: Faker::PhoneNumber.phone_number,
#     web_page: Faker::Internet.url,
#     image: Faker::Company.logo,  
#     password: 123456,
#     password_confirmation: 123456,
#     )
#   puts "User created!"
# end
# users = User.all

# #Seed works
# users.each do |user|
#   5.times do
#     user.works.create(
#       code: Faker::Code.isbn,
#       name: Faker::Lorem.word,
#       address: Faker::Address.street_address, 
#       zip_code: Faker::Address.zip_code, 
#       city: Faker::Address.city, 
#       state: Faker::Address.state,
#       country: Faker::Address.country,
#       client: Faker::Name.name,
#       client_phone: Faker::PhoneNumber.phone_number,
#       client_email: Faker::Internet.email,
#       client_address: Faker::Address.street_address,
#       )
#     puts "Work created!"
#   end
# end

# #Seed suppliers
# users.each do |user|
#   5.times do
#     user.suppliers.create(
#       name: Faker::Company.name, 
#       guild: ["plumbing", "electrical", "carpenter", "welder", "tiler", "masonry", "painter", "glazier"].sample,
#       email: Faker::Internet.email, 
#       address: Faker::Address.street_address, 
#       zip_code: Faker::Address.zip_code, 
#       city: Faker::Address.city, 
#       state: Faker::Address.state,
#       country: Faker::Address.country,
#       phone_number_1: Faker::PhoneNumber.phone_number,
#       phone_number_2: Faker::PhoneNumber.cell_phone,
#       fax_number: Faker::PhoneNumber.phone_number,
#       web_page: Faker::Internet.url,
#       )
#     puts "Supplier created!"
#   end
# end

# 10.times do
#   Fix.create(
#     work_id: 1,
#     supplier_id: 1,
#     code: 123,
#     localization: ["hall", "kitchen", "bathroom", "corridor", "balcony"].sample,
#     comment: "shitty shit",
#     )
#   puts "Fix created!"
# end











