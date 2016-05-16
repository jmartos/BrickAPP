#Seed users
10.times do
  email = [ Faker::Internet.email ].sample
  name = [ Faker::Company.name ].sample
  address = [ Faker::Address.street_address ].sample
  zip_code = [ Faker::Address.zip_code ].sample
  city = [ Faker::Address.city ].sample
  country = [ Faker::Address.country ].sample
  phone_number_1 = [ Faker::PhoneNumber.phone_number ].sample
  phone_number_2 = [ Faker::PhoneNumber.cell_phone ].sample
  fax_number = [ Faker::PhoneNumber.phone_number ].sample
  web_page = [ Faker::Internet.url ].sample
  image = [ Faker::Company.logo ].sample
  password = 123456
  password_confirmation = 123456
  
  puts "Creating #{email}"
  User.create(
    email: email, 
    name: name, 
    address: address, 
    zip_code: zip_code, 
    city: city, 
    country: country,
    phone_number_1: phone_number_1,
    phone_number_2: phone_number_2,
    fax_number: fax_number,
    web_page: web_page,
    image: image,  
    password: password,
    password_confirmation: password_confirmation,
    ) 
end

