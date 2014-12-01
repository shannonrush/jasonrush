require 'spec_helper'

describe Comment do
  describe "named scopes" do
    it "should return only records where active = true for #active" do
      c1 = FactoryGirl.create :comment
      c2 = FactoryGirl.create :comment, active: false
      Comment.count.should == 2
      Comment.active.count.should == 1
      Comment.active.first.should == c1
    end
  end

  describe "helpers" do
    it "should return 'Anonymous' from name_or_anonymous if there is no name" do
      comment = FactoryGirl.create :comment
      comment.name.should_not be_blank
      comment.name_or_anonymous.should == comment.name
      comment.name = nil
      comment.name_or_anonymous.should == "Anonymous"
      comment.name = ''
      comment.name_or_anonymous.should == "Anonymous"
    end
  end
end
