require 'rails_helper'

RSpec.describe "ballots/index", type: :view do
  before(:each) do
    assign(:ballots, [
      Ballot.create!(),
      Ballot.create!()
    ])
  end

  it "renders a list of ballots" do
    render
  end
end
