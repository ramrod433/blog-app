require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'adds a comment' do
    author = User.new(name: 'Tom', photo: 'pic.jpeg', bio: 'Bio for user', postsCounter: 0)
    post = Post.new(title: 'New test post', text: 'Hello', author:, likesCounter: 0, commentsCounter: 0)
    post.save

    comment_creator = User.new(name: 'Jerry', photo: 'pic.jpeg', bio: 'Bio for user', postsCounter: 0)
    comment_creator.save!

    post.comments.create!(text: 'Hello', author: comment_creator)
    post.comments.create!(text: 'second post', author: comment_creator)
    expect(post.comments.length).to eql(2)
  end
end
