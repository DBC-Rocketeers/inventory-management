class InventoriesController < ApplicationController
  before_action :authorize
  def index
    @inventory = Inventory.all.uniq {|entry| entry.part_id}
  end

end