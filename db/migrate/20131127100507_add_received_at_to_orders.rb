class AddReceivedAtToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :received_at, :datetime
  end
end
