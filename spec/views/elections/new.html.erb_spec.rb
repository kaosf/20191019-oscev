require 'rails_helper'

RSpec.describe "elections/new", type: :view do
  before(:each) do
    assign(:election, Election.new(
      :l => "9.99",
      :m => "9.99",
      :g => "9.99",
      :n => "9.99",
      :n_sq => "9.99",
      :b => 100
    ))
  end

  it "renders new election form" do
    render

    assert_select "form[action=?][method=?]", elections_path, "post" do

      assert_select "input[name=?]", "election[l]"

      assert_select "input[name=?]", "election[m]"

      assert_select "input[name=?]", "election[g]"

      assert_select "input[name=?]", "election[n]"

      assert_select "input[name=?]", "election[n_sq]"

      assert_select "input[name=?]", "election[b]"
    end
  end
end
