class OrdersController < ApplicationController

  def new
    @warehouse = Warehouse.all
    @inventory = Part.all
  end

  def index
    @orders = Order.all
  end

  def show
    p params
    @order = Order.find(params[:id])
  end

end
