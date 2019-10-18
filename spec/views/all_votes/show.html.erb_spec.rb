require 'rails_helper'

RSpec.describe "all_votes/show", type: :view do
  before(:each) do
    @all_vote = assign(:all_vote, AllVote.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
