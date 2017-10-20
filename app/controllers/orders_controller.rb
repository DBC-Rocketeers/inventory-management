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
    # if @order.submitted == false
    #   render 'order#show'
    # elsif @order.fulfilled == false
    #   render fufling
    # else
    #   render closed
    # end
  end

  def update
    @order = Order.find(params[:id])
    # @order.add_entry(params)
    @order.add_entry(entry_params)
    if params[:submit]
      @order.submitted = true
    end
    redirect_to order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:name)
  end

  def entry_params
    entry = params.require(:entry).permit(:name, :number, :ordered_quantity)
    p "*" * 50
    p entry
    entry
  end
end
