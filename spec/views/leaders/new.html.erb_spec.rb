require 'rails_helper'

RSpec.describe "leaders/new", :type => :view do
  before(:each) do
    assign(:leader, Leader.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new leader form" do
    render

    assert_select "form[action=?][method=?]", leaders_path, "post" do

      assert_select "input#leader_name[name=?]", "leader[name]"

      assert_select "input#leader_email[name=?]", "leader[email]"
    end
  end
end
