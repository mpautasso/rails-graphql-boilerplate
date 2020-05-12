It's a full-on replacement for REST APIs, rails API controllers, and JSON serializers.

### System dependencies:

* Ruby 2.7.1
* PostgreSQL
* Bundler
* RVM (Not a mandatory one but makes it much easier for a development environment:)

### Installation

To install:

    $ git clone git@github.com:mpautasso/rails-graphql-boilerplate.git
    $ cd rails-graphql-boilerplate

For the purpose of this document we assume that you have installed the latest stable `rvm` (which at the time of writing is `1.29.10`). And we also assume that you have the latest stable version of `Ruby 2.7.1`.

In our gemset you are using you should have `bundler`:

    $ gem install bundler

### Create a new role in Postgresql

    $ psql template1
    $ create role rails_api with encrypted password 'rails_api' login createdb;
    $ \q

### Set up your local configuration

1. Run `cp config/example.database.yml config/database.yml` to make a local version of the database config.
2. Update config/database.yml as necessary to reflect a local postgresql account (e.g. root) with permissions to create databases.
3. Run `cp example.env .env` to make a local version of the app settings.
4. Update .env as necessary with valid credentials.

### Finally run:

    $ bundle install
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    $ rails s

And you should be able to browse to [http://localhost:3000/graphiql](http://localhost:3000/graphiql) and you should see an in-browser IDE for exploring GraphQL.


GraphQL API is ready to play, try running the `users` query:

```graphql
query getUsers {
  users {
    id
    firstName
    lastName
    email
    postsCount
    posts {
      id
      title
      body
    }
  }
}
```
