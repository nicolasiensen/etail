class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def confirm
    order = Order.find_by_uid(params[:uid])
    order.update_attributes confirmed_at: Time.now
    render status: :ok, nothing: true
  end

  def create
    Order.create(params[:order].permit(:uid, :subtotal))
    render status: :ok, nothing: true
  end
end
