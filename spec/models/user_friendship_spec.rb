# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do

  let(:user1) { User.create(id:1, name: 'user1', email: 'user1@example.com') }
  let(:user2) { User.create(id:2, name: 'user2', email: 'user2@example.com') }
  let(:user3) { User.create(id:3, name: 'user3', email: 'user3@example.com') }

  let(:friendship) { Friendship.new(user_id: user1.id, friend_id: user2.id, confirmed: true) }
  let(:friendship2) { Friendship.new(user_id: 1, friend_id: 1, confirmed: false) }

  it 'Checks if User 1 its not valid' do
    user1.save
    expect(user1).not_to be_valid
  end

  it 'Checks if friendship is valid' do
    friendship.save
  end

end
