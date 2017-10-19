class Inventory < ApplicationRecord
  belongs_to :part
  belongs_to :warehouse

  def global_count
    Inventory.where(part_id: self.part_id).count
  end
end
