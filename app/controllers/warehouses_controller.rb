class WarehousesController < ApplicationController
  before_action :authorize
  def index
    @warehouses = Warehouse.all
  end

  def show
    @inventory = Warehouse.find(params[:id]).parts.uniq
  end

end
