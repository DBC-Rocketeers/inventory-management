class OrdersController < ApplicationController

  def new
    @warehouse = Warehouse.all

  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to 'orders#show'
  end

def show
  
end

  private
  def order_params
    params.require(:order).permit(:warehouse_id)
  end
end
