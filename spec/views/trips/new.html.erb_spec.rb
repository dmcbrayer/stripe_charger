require 'rails_helper'

RSpec.describe "trips/new", :type => :view do
  before(:each) do
    assign(:trip, Trip.new(
      :title => "MyString"
    ))
  end

  it "renders new trip form" do
    render

    assert_select "form[action=?][method=?]", trips_path, "post" do

      assert_select "input#trip_title[name=?]", "trip[title]"
    end
  end
end
