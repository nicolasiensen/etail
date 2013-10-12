require 'machinist/active_record'

Order.blueprint do
  uid       { sn }
  subtotal  { rand(500) + 100 }
end
