class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.datetime :confirmed_at
      t.datetime :canceled_at
      t.integer  :store_id
      t.string   :code

      t.timestamps
    end
  end
end
