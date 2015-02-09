require 'rails_helper'

RSpec.describe "leaders/edit", :type => :view do
  before(:each) do
    @leader = assign(:leader, Leader.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit leader form" do
    render

    assert_select "form[action=?][method=?]", leader_path(@leader), "post" do

      assert_select "input#leader_name[name=?]", "leader[name]"

      assert_select "input#leader_email[name=?]", "leader[email]"
    end
  end
end
