require 'rails_helper'

RSpec.describe "all_votes/edit", type: :view do
  before(:each) do
    @all_vote = assign(:all_vote, AllVote.create!())
  end

  it "renders the edit all_vote form" do
    render

    assert_select "form[action=?][method=?]", all_vote_path(@all_vote), "post" do
    end
  end
end
