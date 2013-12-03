class AlterColumnReceivedAtFromOrders < ActiveRecord::Migration
  def up
    execute "alter table orders alter received_at type timestamp with time zone"
  end
  
  def down
    execute "alter table orders alter received_at type timestamp without time zone"
  end
end
