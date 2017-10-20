class Warehouse < ApplicationRecord
  has_many :inventories
  has_many :parts, through: :inventories
  has_many :orders

  def new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    redirect_to warehouses_route
  end

  def inventory
    @inventory = self.parts.uniq
  end

  private
  def warehouse_params
    params(:warehouse).permit(:name)
  end
end
