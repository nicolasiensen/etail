class Order < ActiveRecord::Base
  validates :subtotal, :uid, presence: true
  validates :uid, uniqueness: true

  def confirmed?
    confirmed_at.present?
  end
end
