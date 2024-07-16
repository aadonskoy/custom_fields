class FieldValueMultiselect < FieldValue
  serialize :value, type: Array, coder: JSON
  validate :options_validation

  private

  def options_validation
    invalid_options = value.compact.uniq - field_template.select_options
    errors.add(:value, "has incorrect selection: #{invalid_options}") if invalid_options.present?
  end
end
