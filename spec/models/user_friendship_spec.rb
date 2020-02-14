require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(id: 1, name: 'user1', email: 'user1@example.com', password: '12345678') }
  let(:user2) { User.new(id: 2, name: 'user2', email: 'user2@example.com', password: '12345678') }
  let(:friendship) { Friendship.new(user_id: user.id, friend_id: user2.id, confirmed: false) }

  it 'Check if user 1 is valid' do
    user.save
    expect(user).to be_valid
  end

  it 'Check if is a good relationship valid' do
    user.save
    user2.save
    friendship.save
    expect(friendship).to be_valid
  end

  it 'Check if is a bad relationship valid' do
    user.save
    friendship.save
    expect(friendship).not_to be_valid
  end

  describe 'check if are firends' do
    it 'Check if user 1 and 2 are firends' do
      user.save
      user2.save
      friendship.confirmed = true
      friendship.save
      expect(user.friend?(user2)).to eq(true)
    end

    it 'Check if user 1 and 2 must be not firends' do
      user.save
      user2.save
      friendship.save
      expect(user.friend?(user2)).to eq(false)
    end
  end
end
