require 'rails_helper'

RSpec.describe "elections/index", type: :view do
  before(:each) do
    assign(:elections, [
      Election.create!(
        :l => "9.99",
        :m => "9.99",
        :a => "9.99",
        :b => "9.99"
      ),
      Election.create!(
        :l => "9.99",
        :m => "9.99",
        :a => "9.99",
        :b => "9.99"
      )
    ])
  end

  it "renders a list of elections" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
