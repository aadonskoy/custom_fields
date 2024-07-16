class FieldValueSelect < FieldValue
  validates :value, inclusion: { in: ->(record) { record.field_template.select_options } }
end
