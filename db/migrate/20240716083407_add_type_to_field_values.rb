class AddTypeToFieldValues < ActiveRecord::Migration[7.1]
  def change
    add_column :field_values, :type, :string
  end
end
