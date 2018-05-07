json.products do
  json.array!(@products) do |product|
    json.name product.name
    json.url product_path(product)
  end
end

json.brands do
  json.array!(@brands) do |brand|
    json.name brand.name
    json.url brand_path(brand)
  end
end

json.categories do
  json.array!(@categories) do |category|
    json.name category.name
    json.url category_path(category)
  end
end
