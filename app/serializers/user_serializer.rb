class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :tenant_id

  # Here we need to add our custom fields to the serializer
  def self.dynamic_attributes(tenant_id)
    field_names = FieldTemplate.where(tenant_id: tenant_id).pluck(:name)
    field_names.map { |name| name.parameterize.underscore.to_sym }
  end

  # Override attributes to include dynamic attributes
  def attributes(*args)
    data = super
    self.class.dynamic_attributes(object.tenant_id).each do |attr|
      data[attr] = object.send(attr)
    end
    data
  end
end
