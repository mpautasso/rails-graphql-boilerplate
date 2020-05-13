# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    ## USER QUERIES
    # /users
    field :users, [Types::UserType], null: false

    # /users/:id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    ## POST QUERIES
    # /posts
    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end
  end
end
