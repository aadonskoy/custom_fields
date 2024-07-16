module Customable
  extend ActiveSupport::Concern

  # Here we need to define our methods for custom fields
  # Also we cache the field_values to avoid multiple queries

  included do
    after_initialize :define_custom_fields
  end

  def define_custom_fields
    field_templates = self.tenant.field_templates
    preload_field_values

    field_templates.each do |field_template|
      method_name = field_template.name.parameterize.underscore

      self.class.send(:define_method, method_name) do
        field_value = field_values_cache[field_template.id]
        field_value&.value
      end

      self.class.send(:define_method, "#{method_name}=") do |value|
        field_value = self.field_values.find_or_initialize_by(
          field_template_id: field_template.id,
          type: field_template.field_type
        )
        field_value.value = value
        field_value.save!
        field_values_cache[field_template.id] = field_value
      end
    end
  end

  def preload_field_values
    @field_values_cache = self.field_values.index_by(&:field_template_id)
  end

  def field_values_cache
    @field_values_cache ||= {}
  end
end
