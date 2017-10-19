class WarehousesController < ApplicationController

  def index
    @inventory = Part.all.uniq {|part| part.number }
  end

end
