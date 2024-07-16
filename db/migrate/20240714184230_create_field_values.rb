class CreateFieldValues < ActiveRecord::Migration[7.1]
  def change
    create_table :field_values do |t|
      t.references :field_template, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :value

      t.timestamps
    end
  end
end
