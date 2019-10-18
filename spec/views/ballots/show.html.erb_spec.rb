require 'rails_helper'

RSpec.describe "ballots/show", type: :view do
  before(:each) do
    @ballot = assign(:ballot, Ballot.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
