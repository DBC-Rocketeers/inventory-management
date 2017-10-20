class PartsController < ApplicationController
  before_action :authorize
  def index
    @inventory = Part.all.uniq
  end

end
