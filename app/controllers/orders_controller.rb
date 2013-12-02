require 'csv'

class OrdersController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  respond_to :csv, only: [:index]
  layout false

  def receive
    store = Store.find_by_token(params[:token])
    order = Order.find_by_code(params["code"])
    
    if order.present?
      order.update_attributes! confirmed_at: Time.parse(params["confirmed_at"])
    else
      Order.create!(
        store:        store, 
        code:         params["code"], 
        subtotal:     params["subtotal"], 
        total:        params["total"], 
        received_at:  Time.parse(params["received_at"]), 
        confirmed_at: params["confirmed_at"].present? ? Time.parse(params["confirmed_at"]) : nil
      )
    end

    render status: :ok, nothing: true
  end

  def index
    respond_to do |format|
      format.csv do
        export = CSV.generate do |csv|
          csv << ["Date", "Revenue(R$)"]
          Order.revenue.each do |revenue|
            csv << [revenue["day"], revenue["total"]]
          end
        end 
        render text: export
      end
    end
  end
end
