FactoryBot.define do
  factory :user do
    name{ Faker::Name.name }
    sequence(:email){|n| "abc#{n}@gmail.com"}
    phone do
      p = "0962"
      6.times{p << rand(9).to_s}
      p
    end
    address{Faker::Address.street_address}
    password "123123"
    password_confirmation "123123"
  end

  factory :category do
    sequence(:name){|n| "category##{n}"}
    description Faker::Name.name
  end

  factory :brand do
    sequence(:name){|n| "brand##{n}"}
    description Faker::Name.name
  end

  factory :product_images do
    image "s-1.jpg"
    product
    user
  end

  factory :product do
    sequence(:name){|n| "product##{n}"}
    category
    brand
    quantity {rand(1..50)}
    price {rand(1..500)}
    description Faker::Name.name
    content Faker::Name.name
  end

  factory :rate do
    product
    user
    rate_value {rand 1..5}
  end
end
