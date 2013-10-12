class OrdersController < ApplicationController
  def confirm
    order = Order.find_by_uid(params[:id])
    order.update_attributes confirmed_at: Time.now
    render status: :ok, nothing: true
  end
end
