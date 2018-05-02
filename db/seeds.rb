20.times do
  fakephone = "0962"
  d = rand(1.months).second.ago
  6.times{fakephone << rand(9).to_s}
  User.create name: Faker::HarryPotter.character,
    address: Faker::HarryPotter.location,
    email: Faker::Internet.email, phone: fakephone,
    password: "123123",
    password_confirmation: "123123",
    created_at: d, updated_at: d
end
