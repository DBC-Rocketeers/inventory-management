class Entry < ApplicationRecord
  belongs_to :part
  belongs_to :order
end
