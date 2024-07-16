class FieldValue < ActiveRecord::Base
  belongs_to :field_template

  # to make this feature applicable to other models, we can use polymorphic association (not implemented here)
  belongs_to :user

  validates :value, presence: true
end
