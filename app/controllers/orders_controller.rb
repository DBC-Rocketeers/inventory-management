class OrdersController < ApplicationController

  def new
    @warehouse = Warehouse.all
  end

end
