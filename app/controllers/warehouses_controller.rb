class WarehousesController < ApplicationController
  before_action :authorize
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:notice] = ["You have successfully added new warehouse in #{@warehouse.name}."]
      redirect_to warehouses_path
    else
      flash[:alert] = @warehouse.errors.full_messages
    end
  end


  def show
    @inventory = Warehouse.find(params[:id]).parts.uniq
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:name)
  end

end
