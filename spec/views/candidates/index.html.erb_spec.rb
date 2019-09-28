require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(
        :election => nil,
        :number => 2,
        :name => "Name"
      ),
      Candidate.create!(
        :election => nil,
        :number => 2,
        :name => "Name"
      )
    ])
  end

  it "renders a list of candidates" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
