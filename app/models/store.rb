class Store < ActiveRecord::Base
  validates :name, :token, presence: true
  validates :token, uniqueness: true
end
