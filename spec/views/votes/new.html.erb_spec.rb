require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      :election => nil,
      :m => "9.99",
      :r => "9.99"
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input[name=?]", "vote[election_id]"

      assert_select "input[name=?]", "vote[m]"

      assert_select "input[name=?]", "vote[r]"
    end
  end
end
