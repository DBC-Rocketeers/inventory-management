class Entry < ApplicationRecord
  belongs_to :part
  belongs_to :order
  validates :part, presence: true, uniqueness: { scope: :order }
end
