class OrdersController < ApplicationController

  def new
    @warehouse = Warehouse.all
    @inventory = Part.all
  end

end
