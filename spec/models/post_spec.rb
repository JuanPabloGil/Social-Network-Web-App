require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user2) { User.new(id: 1, name: 'user2istolong', email: 'user2@example.com', password: '12345678') }
  let(:post) { Post.new(id: 1, user_id: '1', content: 'Post content ') }

  it 'Check for valid Post structure ' do
    user2.save
    post.save
    expect(post).to be_valid
  end

  it 'Check if post is valid if the user doesnt exist  ' do
    post.save
    expect(post).not_to be_valid
  end

  it 'Expect invalid content of post (too long ) ' do
    user2.save
    post.content =  "a" * 1001
    post.save
    expect(post).not_to be_valid
  end

end
