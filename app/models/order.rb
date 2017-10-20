class Order < ApplicationRecord
  has_many :entries
  belongs_to :warehouses
  has_many :parts, through: :entries
end
