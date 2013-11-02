class Order < ActiveRecord::Base
  validates :subtotal, :store_id, presence: true

  belongs_to :store

  def confirmed?
    confirmed_at.present?
  end
end
