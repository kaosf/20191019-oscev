require 'rails_helper'

RSpec.describe "ballots/edit", type: :view do
  before(:each) do
    @ballot = assign(:ballot, Ballot.create!())
  end

  it "renders the edit ballot form" do
    render

    assert_select "form[action=?][method=?]", ballot_path(@ballot), "post" do
    end
  end
end
