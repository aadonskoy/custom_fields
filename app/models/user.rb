class User < ApplicationRecord
  include Customable

  belongs_to :tenant
  has_many :field_values, as: :customable, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :tenant_id, case_sensitive: false }
end
