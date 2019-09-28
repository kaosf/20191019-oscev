require 'rails_helper'

RSpec.describe "elections/show", type: :view do
  before(:each) do
    @election = assign(:election, Election.create!(
      :l => "9.99",
      :m => "9.98",
      :g => "9.97",
      :n => "9.96",
      :n_sq => "9.95"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.98/)
    expect(rendered).to match(/9.97/)
    expect(rendered).to match(/9.96/)
    expect(rendered).to match(/9.95/)
  end
end
