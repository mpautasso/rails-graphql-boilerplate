# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users' do
    let!(:users) { create_pair(:user) }

    let(:query) do
      %(query {
        users {
          firstName
          lastName
          email
        }
      })
    end

    subject(:result) do
      RailsGraphqlBoilerplateSchema.execute(query).as_json
    end

    it 'returns all users' do
      expect(result.dig('data', 'users')).to match_array(
        users.map do |user|
          {
            'firstName' => user.first_name,
            'lastName' => user.last_name,
            'email' => user.email
          }
        end
      )
    end
  end

  describe 'posts' do
    let!(:posts) { create_pair(:post) }

    let(:query) do
      %(query {
        posts {
          title
          body
        }
      })
    end

    subject(:result) do
      RailsGraphqlBoilerplateSchema.execute(query).as_json
    end

    it 'returns all posts' do
      expect(result.dig('data', 'posts')).to match_array(
        posts.map do |post|
          {
            'title' => post.title,
            'body' => post.body
          }
        end
      )
    end
  end
end
