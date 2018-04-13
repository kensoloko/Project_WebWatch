20.times do |x|
  fakephone = "0962"
  6.times {fakephone << rand(9).to_s}
  User.create(name: Faker::HarryPotter.character,
    address: Faker::HarryPotter.location,
    email: Faker::Internet.email, phone: fakephone,
    password: "123123",
    password_confirmation: "123123"
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
    content: Faker::ChuckNorris.fact, Category_id: rand(1..5),
    Brand_id: rand(1..5), image: image_url
  )
end

200.times do |x|
  Comment.create(
    User_id: rand(1..20),
    Product_id: rand(1..20),
    content: Faker::BackToTheFuture.quote
  )
end

1000.times do |x|
  Rate.create(
    User_id: rand(1..20),
    Product_id: rand(1..20),
    rate_value: rand(1..5)
  )
end
