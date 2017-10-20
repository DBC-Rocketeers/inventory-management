class Warehouse < ApplicationRecord
  has_many :inventories
  has_many :parts, through: :inventories
  has_many :orders


  def inventory
    @inventory = self.parts.uniq
  end


end
