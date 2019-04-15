Faker::Config.locale = :ja



30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
