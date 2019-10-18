require 'rails_helper'

RSpec.describe "ballots/new", type: :view do
  before(:each) do
    assign(:ballot, Ballot.new())
  end

  it "renders new ballot form" do
    render

    assert_select "form[action=?][method=?]", ballots_path, "post" do
    end
  end
end
