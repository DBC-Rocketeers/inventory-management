class Order < ApplicationRecord
  has_many :entries
  belongs_to :warehouse
  
  accepts_nested_attributes_for :entries
end
