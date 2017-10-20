class Entry < ApplicationRecord
  belongs_to :order
  belongs_to :part
  belongs_to :warehouse
end
