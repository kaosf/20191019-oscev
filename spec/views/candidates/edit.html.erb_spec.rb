require 'rails_helper'

RSpec.describe "candidates/edit", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      :election => nil,
      :number => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit candidate form" do
    render

    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do

      assert_select "input[name=?]", "candidate[election_id]"

      assert_select "input[name=?]", "candidate[number]"

      assert_select "input[name=?]", "candidate[name]"
    end
  end
end
