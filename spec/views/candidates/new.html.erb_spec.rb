require 'rails_helper'

RSpec.describe "candidates/new", type: :view do
  before(:each) do
    assign(:candidate, Candidate.new(
      :election => nil,
      :number => 1,
      :name => "MyString"
    ))
  end

  it "renders new candidate form" do
    render

    assert_select "form[action=?][method=?]", candidates_path, "post" do

      assert_select "input[name=?]", "candidate[election_id]"

      assert_select "input[name=?]", "candidate[number]"

      assert_select "input[name=?]", "candidate[name]"
    end
  end
end
