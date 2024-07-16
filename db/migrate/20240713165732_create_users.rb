class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end

    add_index :users, [:tenant_id, :name], unique: true
  end
end