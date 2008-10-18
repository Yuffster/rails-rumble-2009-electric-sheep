require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bibliographies/edit.html.erb" do
  include BibliographiesHelper

  before(:each) do
    assigns[:bibliography] = @bibliography = stub_model(Bibliography, :new_record? => false)
  end

  it "should render edit form" do
    render "/bibliographies/edit.html.erb"

    response.should have_tag("form[action=#{bibliography_path(@bibliography)}][method=post]") do
    end
  end
end
