def to_url string
  return store_orders_path(@store, format: :csv) if string == "the orders page of this store"
end

def to_content string
  return "#{@order.created_at.strftime("%Y%m%d")},#{@order.subtotal.to_i}" if string == "this order"
end
