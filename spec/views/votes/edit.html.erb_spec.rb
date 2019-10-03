require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :election => nil,
      :c => "9.99"
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input[name=?]", "vote[election_id]"

      assert_select "input[name=?]", "vote[m]"

      assert_select "input[name=?]", "vote[r]"
    end
  end
end
