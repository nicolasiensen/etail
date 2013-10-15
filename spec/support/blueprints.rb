require 'machinist/active_record'

Order.blueprint do
  store     { Store.make! }
  uid       { sn }
  subtotal  { rand(500) + 100 }
end

Store.blueprint do
  uid   { sn }
  name  { Faker::Company.name }
end
