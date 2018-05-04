10.times do
  d = rand(6.months).second.ago
  bill = Bill.create(user_id: 22, status: rand(1..5),
    created_at: d, updated_at: d)
  rand(1..5).times do
    bill.bill_details.create(product_id: rand(36..43),
      quantity: rand(1..10), created_at: d, updated_at: d)
  end
end
