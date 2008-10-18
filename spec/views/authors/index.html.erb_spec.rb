require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authors/index.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:authors] = [
      stub_model(Author,
        :name => "value for name"),
      stub_model(Author,
        :name => "value for name")
    ]
  end

  it "should render list of authors" do
    render "/authors/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end
