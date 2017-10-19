class Warehouse < ApplicationRecord
  has_many :inventories
  has_many :parts, through: :inventories

  def location_list
    names_list = []
    Warehouse.all.each do |warehouse|
      names_list << warehouse.name
    end
    names_list
  end
end
