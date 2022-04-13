class ImssNumberValidator < ActiveModel::EachValidator
  IMSS_NUMBER_REGEX = /^(-*\d-*){11}$/

  def validate_each(record, attribute, value)
    unless value.nil? || value =~ IMSS_NUMBER_REGEX
      record.errors.add attribute, :invalid
    end
  end
end
