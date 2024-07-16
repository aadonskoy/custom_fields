# README

This is a simple service that demonstrates how to implement custom fields configurable per tenant.

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
