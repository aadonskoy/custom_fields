# All existing associations will be lost. This is acceptable in case the database have just test data.
# In other case recommended to break this migration into two separate migrations:
# 1. AddPolymorphicAssociationToFieldValues
# 2. MigrateFieldValuesToPolymorphicAssociation
# 3. DropColumnUserIdFromFieldValues

class AddPolymorphicAssociationToFieldValues < ActiveRecord::Migration[7.1]
  def change
    remove_column :field_values, :user_id
    add_reference :field_values, :customable, polymorphic: true, index: true
  end
end
