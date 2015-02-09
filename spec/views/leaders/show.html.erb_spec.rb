require 'rails_helper'

RSpec.describe "leaders/show", :type => :view do
  before(:each) do
    @leader = assign(:leader, Leader.create!(
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
