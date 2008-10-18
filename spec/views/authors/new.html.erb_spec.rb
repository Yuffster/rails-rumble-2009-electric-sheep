require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authors/new.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:author] = stub_model(Author,
      :new_record? => true,
      :name => "value for name")
  end

  it "should render new form" do
    render "/authors/new.html.erb"

    response.should have_tag("form[action=?][method=post]", authors_path) do
      with_tag("input#author_name[name=?]", "author[name]")
    end
  end
end
