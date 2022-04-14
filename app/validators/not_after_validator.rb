class NotAfterValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    other_date = record.send(options.fetch(:with))

    return if value.blank? || other_date.blank?

    record.errors.add(attribute, :invalid) if value > other_date
  end
end
