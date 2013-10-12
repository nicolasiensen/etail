class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.datetime :received_at
      t.datetime :confirmed_at
      t.datetime :canceled
      t.string :uid

      t.timestamps
    end
  end
end
