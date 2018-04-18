20.times do |x|
  fakephone = "0962"
  6.times {fakephone << rand(9).to_s}
  User.create(name: Faker::HarryPotter.character,
    address: Faker::HarryPotter.location,
    email: Faker::Internet.email, phone: fakephone,
    password: "123123",
    password_confirmation: "123123",
    is_admin: true
  )
end

5.times do |x|
  Category.create(name: Faker::Coffee.blend_name, description: Faker::ChuckNorris.fact)
end

5.times do |x|
  Brand.create(name: Faker::Company.name, description: Faker::ChuckNorris.fact)
end

20.times do |x|
  image_url = %W(#{Faker::Avatar.image} #{Faker::Avatar.image} #{Faker::Avatar.image})
  Product.create(name: Faker::DragonBall.character, price: rand(1000..10000),
    quantity: rand(1..500), description: Faker::ChuckNorris.fact,
    content: Faker::ChuckNorris.fact, category_id: rand(1..5),
    brand_id: rand(1..5), image: image_url
  )
end

100.times do |x|
  Comment.create(
    user_id: rand(1..20),
    product_id: rand(1..20),
    content: Faker::BackToTheFuture.quote
  )
end

100.times do |x|
  Rate.create(
    user_id: rand(1..20),
    product_id: rand(1..20),
    rate_value: rand(1..5)
  )
end

100.times do |x|
  Bill.create(
    user_id: rand(1..20),
    status: rand(1..5)
  )
end

500.times do |x|
  bill = Bill.find_by id: rand(1..100)
  bill.bill_details.create product_id: rand(1..20), quantity: rand(1..10)
end
