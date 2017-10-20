class Order < ApplicationRecord
  has_many :entries
  belongs_to :warehouse

  def add_entry(name, number, quantity)
    part = Part.find_by(number: number)
    if part
      Entry.create(order: self, part: part, ordered_quantity: quantity)
    else
      part = Part.create(name: name, number: number)
      Entry.create(order: self, part: part, ordered_quantity: quantity)
    end
  end
end
