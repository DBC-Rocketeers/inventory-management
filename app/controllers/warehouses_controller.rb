class WarehousesController < ApplicationController
  before_action :authorize
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    redirect_to warehouses_route
  end


  def show
    @inventory = Warehouse.find(params[:id]).parts.uniq
  end

  private
  def warehouse_params
    params(:warehouse).permit(:name)
  end

end
