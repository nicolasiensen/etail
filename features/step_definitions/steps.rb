Given(/^there is an order$/) do
  @order = Order.make!
end

When(/^I confirm this order$/) do
  post confirm_order_path order: { uid: @order.uid }
end

Then(/^this order should be confirmed$/) do
  @order.reload.should be_confirmed
end
