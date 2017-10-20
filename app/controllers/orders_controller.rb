class OrdersController < ApplicationController

  def new
    @warehouse = Warehouse.all

  end

  def create
    warehouse = Warehouse.find_by(name: order_params['name'])
    @order = Order.create(warehouse: warehouse)
    redirect_to order_path(@order)
  end

  def show
  end

  def update
    @order = params[:id]
    redirect_to order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:name)
  end
end
