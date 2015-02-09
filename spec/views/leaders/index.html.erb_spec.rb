require 'rails_helper'

RSpec.describe "leaders/index", :type => :view do
  before(:each) do
    assign(:leaders, [
      Leader.create!(
        :name => "Name",
        :email => "Email"
      ),
      Leader.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of leaders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
