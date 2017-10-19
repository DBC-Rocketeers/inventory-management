class Part < ApplicationRecord
  has_many :inventories
  has_many :warehouses, through: :inventories

  def global_count
    Part.where(name: self.name).count
  end
end
