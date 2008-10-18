require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/show.html.erb" do
  include StylesHelper

  before(:each) do
    assigns[:style] = @style = stub_model(Style,
      :name => "value for name",
      :description => "value for description")
  end

  it "should render attributes in <p>" do
    render "/styles/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end
