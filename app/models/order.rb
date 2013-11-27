class Order < ActiveRecord::Base
  validates :subtotal, :store_id, :code, :received_at, presence: true
  validates :code, uniqueness: {scope: :store_id}

  belongs_to :store

  def confirmed?
    confirmed_at.present?
  end

  def self.revenue
    ActiveRecord::Base.connection.execute("SELECT to_char(orders.received_at, 'yyyymmdd') AS \"day\", sum(orders.subtotal) AS \"subtotal\" FROM orders GROUP BY 1 ORDER BY 1 DESC")
  end
end
