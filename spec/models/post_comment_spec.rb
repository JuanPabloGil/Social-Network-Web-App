require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user2) { User.new(id: 1, name: 'user2istolong', email: 'user2@example.com', password: '12345678') }
  let(:post) { Post.new(id: 1, user_id: 1, content: 'Post content ') }
  let(:comment) { Comment.new(user_id: 1, post_id: 1, content: 'Comment content ') }


  it 'Check for valid Comment structure ' do
    user2.save
    post.save
    comment.save
    expect(comment).to be_valid
  end

  it 'Check if comment is valid if the user doesnt exist  ' do
    post.save
    expect(post).not_to be_valid
  end


  it 'Check if comment is valid if the post doesnt exist  ' do
    expect(post).not_to be_valid
  end

  it 'Expect invalid content of comment (too long ) ' do
    user2.save
    post.save
    comment.content =  " a " * 300
    comment.save
    expect(comment).not_to be_valid
  end

end
