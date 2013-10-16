require 'csv'

class OrdersController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  respond_to :csv, only: [:index]
  layout false

  def confirm
    params = JSON.parse(request.body.read)
    order = Order.find_by_uid(params["uid"])
    order.update_attributes confirmed_at: Time.now
    render status: :ok, nothing: true
  end

  def create
    params = JSON.parse(request.body.read)
    params["order"]["uid"] = params["order"]["id"]
    params["order"]["store_id"] = Store.find_by_uid(params["order"]["store_id"]).id
    Order.create(params["order"])
    render status: :ok, nothing: true
  end

  def index
    respond_to do |format|
      format.csv do
        export = CSV.generate do |csv|
          csv << ["Date", "Revenue(R$)"]
          collection.each do |order|
            csv << [order.received_at.strftime("%Y%m%d"), order.subtotal.to_s]
          end
        end 
        render text: export
      end
    end
  end
end
