class FieldValue < ActiveRecord::Base
  belongs_to :field_template
  belongs_to :customable, polymorphic: true

  validates :value, presence: true
end
