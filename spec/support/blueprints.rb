require 'machinist/active_record'

Order.blueprint do
  store       { Store.make! }
  subtotal    { rand(500) + 100 }
  total       { rand(500) + 100 }
  code        { sn }
  received_at { Time.now }
end

Store.blueprint do
  name  { Faker::Company.name }
  token { Digest::SHA1.hexdigest(Time.now.to_s) }
end
