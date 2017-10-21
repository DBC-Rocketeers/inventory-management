class Warehouse < ApplicationRecord

  has_many :inventories
  has_many :parts, through: :inventories
  has_many :orders

  validates :name, presence: true, uniqueness: true


  def inventory
    @inventory = self.parts.uniq
  end
end
