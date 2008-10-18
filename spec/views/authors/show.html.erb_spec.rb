require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authors/show.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:author] = @author = stub_model(Author,
      :name => "value for name")
  end

  it "should render attributes in <p>" do
    render "/authors/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end
