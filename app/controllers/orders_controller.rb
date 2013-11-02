require 'csv'

class OrdersController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  respond_to :csv, only: [:index]
  layout false

  def receive
    store = Store.find_by_token(params[:token])

    order_params = JSON.parse(request.body.read)
    order = Order.find_by_code(order_params["code"])

    if order.present?
      order.update_attribute :confirmed_at, Time.now
    else
      Order.create! store: store, code: order_params["code"], subtotal: order_params["subtotal"]
    end

    render status: :ok, nothing: true
  end

  def index
    respond_to do |format|
      format.csv do
        export = CSV.generate do |csv|
          csv << ["Date", "Revenue(R$)"]
          collection.each do |order|
            csv << [order.created_at.strftime("%Y%m%d"), order.subtotal.to_s]
          end
        end 
        render text: export
      end
    end
  end
end
