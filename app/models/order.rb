class Order < ActiveRecord::Base
  validates :subtotal, :store_id, :code, presence: true
  validates :code, uniqueness: {scope: :store_id}

  belongs_to :store

  def confirmed?
    confirmed_at.present?
  end
end
