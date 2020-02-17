require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user2) { User.new(id: 1, name: 'user2istolong', email: 'user2@example.com', password: '12345678') }
  let(:post) { Post.new(id: 1, user_id: 1, content: 'Post content ') }
  let(:like) { Like.new(user_id: 1, post_id: 1) }


  it 'Check for valid Like ' do
    user2.save
    post.save
    like.save
    expect(like).to be_valid
  end


  it 'Check if like is valid if the user doesnt exist  ' do
    like.save
    expect(like).not_to be_valid
  end


  it 'Check if Like is valid if the post doesnt exist  ' do
    user2.save
    expect(like).not_to be_valid
  end

end
