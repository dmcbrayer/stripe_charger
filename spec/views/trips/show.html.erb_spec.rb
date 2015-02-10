require 'rails_helper'

RSpec.describe "trips/show", :type => :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    pending("Add something meaningful")
  end
end
