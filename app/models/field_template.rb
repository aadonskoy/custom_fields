# frozen_string_literal: true

class FieldTemplate < ActiveRecord::Base
  FIELD_TYPES = [
    NUMBER = "FieldValueNumber",
    TEXT = "FieldValueText",
    SELECT = "FieldValueSelect",
    MULTI_SELECT = "FieldValueMultiselect"
  ].freeze

  belongs_to :tenant
  has_many :field_values, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :tenant_id, case_sensitive: false }
  validates :field_type, inclusion: { in: FIELD_TYPES }
  validates :select_options, presence: true, if: -> { field_type.in?([SELECT, MULTI_SELECT]) }
end
