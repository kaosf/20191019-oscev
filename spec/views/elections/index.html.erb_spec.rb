require 'rails_helper'

RSpec.describe "elections/index", type: :view do
  before(:each) do
    assign(:elections, [
      Election.create!(
        :l => 12480,
        :m => 15342,
        :a => 1,
        :b => 1
      ),
      Election.create!(
        :l => 12480,
        :m => 15342,
        :a => 1,
        :b => 1
      )
    ])
  end

  it "renders a list of elections" do
    render
    assert_select "tr>td", :text => "12480".to_s, :count => 2
    assert_select "tr>td", :text => "15342".to_s, :count => 2
    assert_select "tr>td", :text => "1".to_s, :count => 4
  end
end
