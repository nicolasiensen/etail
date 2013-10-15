Given(/^there is an order$/) do
  @order = Order.make!
end

Given(/^there is a store$/) do
  @store = Store.make!
end

When(/^I confirm this order$/) do
  post confirm_order_path, {uid: @order.uid}.to_json
end

When(/^I create an order uid "(.*?)" for this store$/) do |arg1|
  @order = Order.make! uid: arg1, store: @store
end

Then(/^this order should be confirmed$/) do
  @order.reload.should be_confirmed
end

Then(/^an order with uid "(.*?)" should be created$/) do |arg1|
  Order.find_by_uid(arg1).should_not be_nil
end
