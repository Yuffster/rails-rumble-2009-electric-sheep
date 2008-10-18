require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/index.html.erb" do
  include StylesHelper

  before(:each) do
    assigns[:styles] = [
      stub_model(Style,
        :name => "value for name",
        :description => "value for description"),
      stub_model(Style,
        :name => "value for name",
        :description => "value for description")
    ]
  end

  it "should render list of styles" do
    render "/styles/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end
end
