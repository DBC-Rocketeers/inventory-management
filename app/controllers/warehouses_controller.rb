class WarehousesController < ApplicationController

  def index
    @inventory = []
    Warehouse.all.each do |warehouse|
      warehouse.parts.each do |part|
        p part
        @inventory << part
        p @inventory
      end
    end
    @inventory
  end
end
