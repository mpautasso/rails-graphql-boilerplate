# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :posts, [Types::PostType], null: true
    field :posts_count, Integer, null: true

    def posts_count
      object.posts.count
    end
  end
end