class Warehouse < ApplicationRecord
  has_many :inventories
  has_many :parts, through: :inventories

  def inventory
    @inventory = self.parts.uniq
  end
end
