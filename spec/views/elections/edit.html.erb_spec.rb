require 'rails_helper'

RSpec.describe "elections/edit", type: :view do
  before(:each) do
    @election = assign(:election, Election.create!(
      :l => "9.99",
      :m => "9.99",
      :g => "9.99",
      :n => "9.99",
      :n_sq => "9.99"
    ))
  end

  it "renders the edit election form" do
    render

    assert_select "form[action=?][method=?]", election_path(@election), "post" do

      assert_select "input[name=?]", "election[l]"

      assert_select "input[name=?]", "election[m]"

      assert_select "input[name=?]", "election[g]"

      assert_select "input[name=?]", "election[n]"

      assert_select "input[name=?]", "election[n_sq]"
    end
  end
end
