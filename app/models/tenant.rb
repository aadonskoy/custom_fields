class Tenant < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :field_templates, dependent: :destroy
end
