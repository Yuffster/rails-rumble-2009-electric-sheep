require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bibliographies/index.html.erb" do
  include BibliographiesHelper

  before(:each) do
    assigns[:bibliographies] = [
      stub_model(Bibliography),
      stub_model(Bibliography)
    ]
  end

  it "should render list of bibliographies" do
    render "/bibliographies/index.html.erb"
  end
end
