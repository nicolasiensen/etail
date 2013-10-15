class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
