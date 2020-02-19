require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user2) { User.new(id: 2, name: 'user2istolong', email: 'user2@example.com', password: '12345678') }

  it 'Check for valid user structure ' do
    user2.save
    expect(user2).to be_valid
  end

  it 'Check for invalid user name size ' do
    user2.name = 'abcdfghijklmnopqrstuvwxyzzyxwvutsrqoinmqwwqopidjqpoiwdjqopiwdh8h1982mdh09hmqumdqiwiuwqdhqiouwdhmqwiudmiowdu'
    user2.save
    expect(user2).not_to be_valid
  end

  it 'Check for invalid email name size ' do
    user2.email = 'abcdfgh.com'
    user2.save
    expect(user2).not_to be_valid
  end
end
