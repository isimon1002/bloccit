require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
   let(:my_user) { create(:user) }
   let(:my_topic) { create(:topic) }
   let(:my_post) { create(:post, topic: my_topic, user: my_user) }
   let(:my_comment) { create(:comment, post: my_post, user: my_user) }
    describe "has_posts(user)" do
      it "checks to see if a user has posts" do
          po = my_user.posts.where(user: my_user).create
          expect(helper.has_posts?(my_user)).to eq(true)
      end
  end
     describe "has_comments(user)" do
       it "checks to see if a user has posts" do
          comment = my_user.comments.where(post: my_post, user: my_user).create
          expect(helper.has_comments?(my_user)).to eq(true)
      end
  end
     describe "has_favorites(user)" do
       it "checks to see if a user has favorites" do
          favorite = my_user.favorites.where(post: my_post, user: my_user).create
          expect(helper.has_favorites?(my_user)).to eq(true)
      end
  end
end
