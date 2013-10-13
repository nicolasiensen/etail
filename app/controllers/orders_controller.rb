class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def confirm
    params = JSON.parse(request.body.read)
    order = Order.find_by_uid(params["uid"])
    order.update_attributes confirmed_at: Time.now
    render status: :ok, nothing: true
  end

  def create
    params = JSON.parse(request.body.read)
    Order.create(params["order"])
    render status: :ok, nothing: true
  end
end
