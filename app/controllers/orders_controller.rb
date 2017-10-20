class OrdersController < ApplicationController

  def new
    @warehouse = Warehouse.all

  end

  def create
    p order_params
    p order_params['name']
    warehouse = Warehouse.find_by(name: order_params['name'])
    @order = Order.create(warehouse: warehouse)
    redirect_to order_path(@order)
  end

def show

end

  private
  def order_params
    params.require(:order).permit(:name)
  end
end
