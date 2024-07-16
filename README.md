# README

This is a simple service that demonstrates how to implement custom fields configurable per tenant.
The FieldVaule model is used to store the custom fields for each user in scope of tenant.
The FieldValue model has a polymorphic association with the User model and can be associated with other models (and `Customable` concern should be included as well).

## How to add a new field for a tenant
To add a new field for particular tenant, you can create a new model and include `Customable` concern in it.
Ex:

```ruby
FieldTemplate.create!(
  name: "Skills",
  field_type: "FieldValueMultiselect",
  select_options: %w[writing reading coding],
)
```

`name` - name of the field
`field_type` - type of the field (`FieldValueSelect`, `FieldValueMultiselect`, `FieldValueText`, `FieldValueNumber`)
`select_options` - array of options for select fields, can be omitted for other field types

## How add a new type of field

You can create a new field type by creating a new model that inherits from `FieldValue` and add serialization for value field to desired type.
Also you can add a validation for the value field in the model.
Then update `FieldTemplate` model to include the new field type into the constant `FIELD_TYPES`.

# How to run

To start the app you can use dockerized postgres database. To start the database run the following command:

```bash
docker compose up -d
```

To start and seed rails application:

    ```bash
    bundle install
    rails db:create db:migrate db:seed
    rails s
    ```

seed.rb file contains the following code example of how to create custom fields for a tenant

To list all users for all tenants in postman:

    ```bash
    [GET] http://localhost:3000/users
    ```

To show specific user:

    ```bash
    [GET] http://localhost:3000/users/1
    ```

To update user information including custom fields:

    ```bash
    [PUT] http://localhost:3000/users/1
    ```

Payload:

    ```json
    {
        "user": {
            "name": "Sam",
            "age": 12,
            "about": "lorem ipsum dolores",
            "roles": "admin",
            "skills": ["writing"]
        }
    }
    ```json
