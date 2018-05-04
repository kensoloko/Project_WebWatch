1000.times do
  d = rand(6.months).second.ago
  bill = Bill.create(user_id: rand(1..20), status: rand(1..5), created_at: d, updated_at: d)
  rand(1..5).times do
    bill.bill_details.create(product_id: rand(2..7), quantity: rand(1..10), created_at: d, updated_at: d)
  end
end
