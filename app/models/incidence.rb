class Incidence < ApplicationRecord
  belongs_to :employee

  enum incidence_type: %i[deductions perceptions]
  enum concept: %i[illness absence delay vacation extrahours extraday]

  validates_numericality_of :amount, greater_than: 0
end
