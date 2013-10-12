class OrdersController < ApplicationController
  def confirm
    order = Order.find_by_uid(params[:order][:uid])
    order.update_attributes confirmed_at: Time.now
    render status: :ok, nothing: true
  end
end
