5.times do |x|
  Category.create(name: Faker::Coffee.blend_name, description: Faker::ChuckNorris.fact)
end

5.times do |x|
  Brand.create(name: Faker::Company.name, description: Faker::ChuckNorris.fact)
end

20.times do |x|
  image_url = %W(#{Faker::Avatar.image},#{Faker::Avatar.image},#{Faker::Avatar.image})
  Product.create(name: Faker::DragonBall.character, price: rand(1000..10000),
    quantity: rand(1..500), description: Faker::ChuckNorris.fact,
    content: Faker::ChuckNorris.fact, Category_id: rand(1..5),
    Brand_id: rand(1..5), image: image_url
  )
end
