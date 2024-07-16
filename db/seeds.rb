# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding the database..."
tenant = Tenant.create!
tenant.field_templates.create!(
  name: "Age",
  field_type: "FieldValueNumber",
)
tenant.field_templates.create!(
  name: "About",
  field_type: "FieldValueText",
)
tenant.field_templates.create!(
  name: "Roles",
  field_type: "FieldValueSelect",
  select_options: %w[admin user superadmin],
)
tenant.field_templates.create!(
  name: "Skills",
  field_type: "FieldValueMultiselect",
  select_options: %w[writing reading coding],
)
%w[Jim Mary Sam].each do |name|
  tenant.users.create!(name: name)
end
user = tenant.users.first
user.update(age: 38, about: "Something interesting here", roles: "user", skills: %w[writing reading])
user = tenant.users.second
user.update(age: 24, about: "Like to code", roles: "admin", skills: %w[coding])
user = tenant.users.third
user.update(age: 42, about: "Like coding writing reading", roles: "superadmin", skills: %w[writing coding reading])


tenant = Tenant.create!
%w[Sam Kai Sally].each do |name|
  tenant.users.create!(name: name)
end

tenant.field_templates.create!(
  name: "Income",
  field_type: "FieldValueNumber",
  )
tenant.field_templates.create!(
  name: "Agreement",
  field_type: "FieldValueSelect",
  select_options: %w[signed not_signed],
  )
tenant.field_templates.create!(
  name: "Notifications",
  field_type: "FieldValueMultiselect",
  select_options: %w[phone email sms],
  )
user = tenant.users.first
user.update(income: 800, agreement: "signed", notifications: %w[phone email])
user = tenant.users.second
user.update(income: 2050, agreement: "not_signed", notifications: %w[email sms])
user = tenant.users.third
user.update(income: 3300, agreement: "signed", notifications: %w[phone sms])
puts "Seeding done!"
