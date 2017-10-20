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
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    # @order.add_entry(params)
    @order.add_entry({name: params[:name], number: params[:number], quantity: params[:quantity]})
    redirect_to order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:name)
  end

  def entry_params
    params.require(:entry).permit(:name, :number, :ordered_quantity)
  end
end
