class Employee < ApplicationRecord
  validates_presence_of :first_name, :last_name, :rfc, :date_registered,
    :imss_number
  validates_uniqueness_of :rfc, :imss_number
  validates :rfc, rfc: true
end
