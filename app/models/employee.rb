class Employee < ApplicationRecord
  validates :name, :employee_id, presence: true
  validates :employee_id, uniqueness: true

  has_secure_password
end
