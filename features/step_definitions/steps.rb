Given(/^there is an order$/) do
  @order = Order.make!
end

When(/^I confirm this order$/) do
  post confirm_order_path, {uid: @order.uid}.to_json
end

When(/^I create an order uid "(.*?)"$/) do |arg1|
  post create_order_path, {order: {uid: arg1, subtotal: 100.0}}.to_json
end

Then(/^this order should be confirmed$/) do
  @order.reload.should be_confirmed
end

Then(/^an order with uid "(.*?)" should be created$/) do |arg1|
  Order.find_by_uid(arg1).should_not be_nil
end
