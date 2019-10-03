require 'rails_helper'

RSpec.describe "votes/index", type: :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :election => nil,
        :c => "9.99"
      ),
      Vote.create!(
        :election => nil,
        :c => "9.99"
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
