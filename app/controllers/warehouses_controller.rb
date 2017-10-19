class WarehousesController < ApplicationController
  before_action :authorize
  def index
    @warehouses = Warehouse.all
  end

end
