class Part < ApplicationRecord
  has_many :inventories
  has_many :warehouses, through: :inventories
  has_many :entries

  def local_count(location)
    warehouse = Warehouse.find_by(name: location)
    parts = warehouse.parts
    parts_with_same_name = parts.where(name: self.name)
    parts_with_same_name.count
  end
end
