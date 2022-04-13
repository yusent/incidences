class Employee < ApplicationRecord
  has_many :contracts
  has_one :active_contract, -> { where(active: true) }, class_name: "Contract"

  validates_presence_of :first_name, :last_name, :rfc, :date_registered,
    :imss_number
  validates_uniqueness_of :rfc, :imss_number
  validates :rfc, rfc: true
  validates :imss_number, imss_number: true

  before_save :remove_dashes_from_imss_number!

  def remove_dashes_from_imss_number!
    self.imss_number&.gsub!(/\D/, '')
  end
end
