require 'rails_helper'

RSpec.describe "elections/index", type: :view do
  before(:each) do
    assign(:elections, [
      Election.create!(
        :l => 1260,
        :m => 879,
        :g => 38192,
        :n => 38191,
        :n_sq => 1458552481,
      ),
      Election.create!(
        :l => 1260,
        :m => 879,
        :g => 38192,
        :n => 38191,
        :n_sq => 1458552481,
      )
    ])
  end

  it "renders a list of elections" do
    render
    assert_select "tr>td", :text => "1260".to_s, :count => 2
    assert_select "tr>td", :text => "879".to_s, :count => 2
    assert_select "tr>td", :text => "38192".to_s, :count => 2
    assert_select "tr>td", :text => "38191".to_s, :count => 2
    assert_select "tr>td", :text => "1458552481".to_s, :count => 2
  end
end
