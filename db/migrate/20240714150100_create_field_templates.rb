class CreateFieldTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :field_templates do |t|
      t.string :name
      t.string :field_type
      t.belongs_to :tenant, null: false, foreign_key: true
      t.string :select_options, array: true, default: []

      t.timestamps
    end

    add_index :field_templates, [:tenant_id, :name], unique: true
  end
end
