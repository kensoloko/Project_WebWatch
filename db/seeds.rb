20.times do
  fakephone = "0962"
  6.times{fakephone << rand(9).to_s}
  User.create name: Faker::HarryPotter.character,
    address: Faker::HarryPotter.location,
    email: Faker::Internet.email, phone: fakephone,
    password: "123123",
    password_confirmation: "123123"
end

5.times do
  Category.create name: Faker::Coffee.blend_name,
    description: Faker::ChuckNorris.fact
end

5.times do
  Brand.create name: Faker::Company.name, description: Faker::ChuckNorris.fact
end
