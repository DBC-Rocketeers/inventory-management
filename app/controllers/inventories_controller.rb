class InventoriesController < ApplicationController
  before_action :authorize
  def index
    @inventory = Inventory.all.uniq {|entry| entry.part_id}
  end

  def new
    @order = Order.find[params[:id]]
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    location = Warehouse.find(receive_params['location'])
    receive_params.each do |entry_id, entry|
      if entry['receive'] == 'yes'
        entry['qty'].to_i.times do
          location.parts << Entry.find(entry_id).part
        end
      end
    end
    redirect_to warehouses_path
  end

  private

  def receive_params
    params.require(:entry).permit!
  end

end
