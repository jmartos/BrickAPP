#Seed users
1.times do
  User.create(
    email: Faker::Internet.email, 
    name: Faker::Company.name, 
    address: Faker::Address.street_address, 
    zip_code: Faker::Address.zip_code, 
    city: Faker::Address.city, 
    state: Faker::Address.state,
    country: Faker::Address.country,
    phone_number_1: Faker::PhoneNumber.phone_number,
    phone_number_2: Faker::PhoneNumber.cell_phone,
    fax_number: Faker::PhoneNumber.phone_number,
    web_page: Faker::Internet.url,
    image: Faker::Company.logo,  
    password: 123456,
    password_confirmation: 123456,
    )
  puts "User created!"
end
users = User.all

#Seed works
users.each do |user|
  5.times do
    user.works.create(
      code: Faker::Code.isbn,
      name: Faker::Lorem.word,
      address: Faker::Address.street_address, 
      zip_code: Faker::Address.zip_code, 
      city: Faker::Address.city, 
      state: Faker::Address.state,
      country: Faker::Address.country,
      client: Faker::Name.name,
      client_phone: Faker::PhoneNumber.phone_number,
      client_email: Faker::Internet.email,
      client_address: Faker::Address.street_address,
      )
    puts "Work created!"
  end
end

#Seed suppliers
users.each do |user|
  5.times do
    user.suppliers.create(
      name: Faker::Company.name, 
      guild: ["plumbing", "electrical", "carpenter", "welder", "tiler", "masonry", "painter", "glazier"].sample,
      email: Faker::Internet.email, 
      address: Faker::Address.street_address, 
      zip_code: Faker::Address.zip_code, 
      city: Faker::Address.city, 
      state: Faker::Address.state,
      country: Faker::Address.country,
      phone_number_1: Faker::PhoneNumber.phone_number,
      phone_number_2: Faker::PhoneNumber.cell_phone,
      fax_number: Faker::PhoneNumber.phone_number,
      web_page: Faker::Internet.url,
      )
    puts "Supplier created!"
  end
end

10.times do
  Fix.create(
    work_id: 1,
    supplier_id: 1,
    code: 123,
    picture: "feo",
    localization: ["hall", "kitchen", "bathroom", "corridor", "balcony"].sample,
    comment: "shitty shit",
    )
  puts "Fix created!"
end











