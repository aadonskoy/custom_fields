class FieldValueNumber < FieldValue
  serialize :value, type: Numeric, coder: JSON
end
