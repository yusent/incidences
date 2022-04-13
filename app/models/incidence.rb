class Incidence < ApplicationRecord
  belongs_to :employee

  enum incidence_type: %i[deductions perceptions]
  enum concept: %i[illness absence delay vacation extrahours extraday]
end
