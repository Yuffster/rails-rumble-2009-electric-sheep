require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bibliographies/show.html.erb" do
  include BibliographiesHelper

  before(:each) do
    assigns[:bibliography] = @bibliography = stub_model(Bibliography)
  end

  it "should render attributes in <p>" do
    render "/bibliographies/show.html.erb"
  end
end
