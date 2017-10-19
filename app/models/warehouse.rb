class Warehouse < ApplicationRecord
  has_many :inventories
  has_many :parts, through: :inventories
end
