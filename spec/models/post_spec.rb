require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#content" do
    context "空白のとき" do
      it 'validでないこと' do
        post = Post.new(content: '')
        post.valid?
        expect(post.errors[:content]).to be_present
      end
    end
    context "制限文字以内のとき" do
      it 'validであること' do
        post = Post.new(content: "t")
        post.valid?
        expect(post.errors[:content]).to be_blank
      end
    end
    context "制限文字を超えたとき" do
      it 'validでないこと' do
        str = ""
        for i in 0..200 do
          str += "a"
        end
        post = Post.new(content: str)
        post.valid?
        expect(post.errors[:content]).to be_present
      end
    end
    end
end
