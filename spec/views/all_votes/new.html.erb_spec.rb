require 'rails_helper'

RSpec.describe "all_votes/new", type: :view do
  before(:each) do
    assign(:all_vote, AllVote.new())
  end

  it "renders new all_vote form" do
    render

    assert_select "form[action=?][method=?]", all_votes_path, "post" do
    end
  end
end
