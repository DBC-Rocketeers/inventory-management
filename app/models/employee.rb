class Employee < ApplicationRecord
  validates :name, :employee_id, :auth?, presence: true
  validates :employee_id, uniqueness: true

  has_secure_password
end
