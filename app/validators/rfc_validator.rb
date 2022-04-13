class RfcValidator < ActiveModel::EachValidator
  RFC_REGEX = /[A-Z&Ñ]{3,4}\d\d(0\d|1[012])(0\d|[12]\d|3[01])[A-Z\d]{2}[\dA]/

  def validate_each(record, attribute, value)
    unless value.nil? || value =~ RFC_REGEX
      record.errors.add attribute, :invalid
    end
  end
end
