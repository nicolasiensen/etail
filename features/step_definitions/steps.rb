Given(/^there is an order$/) do
  @order = Order.make!
end

Given(/^there is a store$/) do
  @store = Store.make!
end

Given(/^there is an order for this store$/) do
  @order = Order.make! store: @store
end

When(/^I confirm this order$/) do
  post receive_order_path(token: @order.store.token), {code: @order.code, status: "confirmed"}.to_json
end

When(/^I create an order code "(.*?)" for this store$/) do |arg1|
  post receive_order_path(token: @store.token), {code: arg1, status: "received", subtotal: "100.0"}.to_json
end

When(/^I go to "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Then(/^this order should be confirmed$/) do
  @order.reload.should be_confirmed
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(to_content(arg1))
end

Then(/^an order with code "(.*?)" should be created$/) do |arg1|
  Order.find_by_code(arg1).should_not be_nil
end
