class WarehousesController < ApplicationController

  def index
    @inventory = []
    Warehouse.all.each do |warehouse|
      warehouse.parts.each do |part|
        @inventory << part
      end
    end
    @inventory
  end
end
