require 'rails_helper'

RSpec.describe "elections/show", type: :view do
  before(:each) do
    @election = assign(:election, Election.create!(
      :l => "9.99",
      :m => "9.99",
      :a => "9.99",
      :b => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
