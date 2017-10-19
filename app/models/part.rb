class Part < ApplicationRecord
  has_many :inventories
  has_many :warehouses, through: :inventories
end
