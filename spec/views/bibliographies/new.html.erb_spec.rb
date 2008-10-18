require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bibliographies/new.html.erb" do
  include BibliographiesHelper

  before(:each) do
    assigns[:bibliography] = stub_model(Bibliography, :new_record? => true)
  end

  it "should render new form" do
    render "/bibliographies/new.html.erb"

    response.should have_tag("form[action=?][method=post]", bibliographies_path) do
    end
  end
end
