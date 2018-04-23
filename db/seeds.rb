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

# 20.times do
#   Product.create name: Faker::DragonBall.character, price: rand(1000..10_000),
#     quantity: rand(1..500), description: Faker::ChuckNorris.fact,
#     content: Faker::ChuckNorris.fact, category_id: rand(1..5),
#     brand_id: rand(1..5)
# end

# 100.times do
#   Comment.create(
#     user_id: rand(1..20),
#     product_id: rand(1..20),
#     content: Faker::BackToTheFuture.quote
#   )
# end

# 100.times do
#   Rate.create(
#     user_id: rand(1..20),
#     product_id: rand(1..20),
#     rate_value: rand(1..5)
#   )
# end

# 100.times do
#   Bill.create(
#     user_id: rand(1..20),
#     status: rand(1..5)
#   )
# end

# 100.times do
#   bill = Bill.find_by id: rand(1..100)
#   bill.bill_details.create product_id: rand(1..20), quantity: rand(1..10)
# end
