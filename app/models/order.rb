class Order < ActiveRecord::Base
  validates :subtotal, :uid, :store_id, presence: true
  validates :uid, uniqueness: true

  belongs_to :store

  def confirmed?
    confirmed_at.present?
  end
end
