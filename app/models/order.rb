class Order < ApplicationRecord
  has_many :entries
  belongs_to :warehouse
end
