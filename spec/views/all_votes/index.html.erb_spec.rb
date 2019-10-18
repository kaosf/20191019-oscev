require 'rails_helper'

RSpec.describe "all_votes/index", type: :view do
  before(:each) do
    assign(:all_votes, [
      AllVote.create!(),
      AllVote.create!()
    ])
  end

  it "renders a list of all_votes" do
    render
  end
end
