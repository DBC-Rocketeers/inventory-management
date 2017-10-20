class Order < ApplicationRecord
  has_many :entries
  belongs_to :warehouse

  def add_entry(args)
    part = Part.find_by(number: args[:number])
    if part
      create_entry(part, args[:ordered_quantity])
    else
      part = Part.create(name: args[:name], number: args[:number])
      create_entry(part, args[:ordered_quantity])
    end
  end

  private

  def create_entry(part, quantity)
    Entry.create(order: self, part: part, ordered_quantity: quantity.to_i)
  end
end
