require 'rails_helper'

RSpec.describe "elections/edit", type: :view do
  before(:each) do
    @election = assign(:election, Election.create!(
      :l => "9.99",
      :m => "9.99",
      :a => "9.99",
      :b => "9.99"
    ))
  end

  it "renders the edit election form" do
    render

    assert_select "form[action=?][method=?]", election_path(@election), "post" do

      assert_select "input[name=?]", "election[l]"

      assert_select "input[name=?]", "election[m]"

      assert_select "input[name=?]", "election[a]"

      assert_select "input[name=?]", "election[b]"
    end
  end
end
