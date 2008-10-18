require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/citations/index.html.erb" do
  include CitationsHelper

  before(:each) do
    assigns[:citations] = [
      stub_model(Citation,
        :title => "value for title",
        :publication_title => "value for publication_title",
        :editor => "value for editor",
        :publisher => "value for publisher",
        :publishing_city => "value for publishing_city",
        :pages => "value for pages",
        :imported_from => "value for imported_from",
        :volume => "1",
        :issue => "1",
        :tags => "value for tags",
        :reference_medium => "value for reference_medium",
        :notes => "value for notes"),
      stub_model(Citation,
        :title => "value for title",
        :publication_title => "value for publication_title",
        :editor => "value for editor",
        :publisher => "value for publisher",
        :publishing_city => "value for publishing_city",
        :pages => "value for pages",
        :imported_from => "value for imported_from",
        :volume => "1",
        :issue => "1",
        :tags => "value for tags",
        :reference_medium => "value for reference_medium",
        :notes => "value for notes")
    ]
  end

  it "should render list of citations" do
    render "/citations/index.html.erb"
    response.should have_tag("tr>td", "value for title", 2)
    response.should have_tag("tr>td", "value for publication_title", 2)
    response.should have_tag("tr>td", "value for editor", 2)
    response.should have_tag("tr>td", "value for publisher", 2)
    response.should have_tag("tr>td", "value for publishing_city", 2)
    response.should have_tag("tr>td", "value for pages", 2)
    response.should have_tag("tr>td", "value for imported_from", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for tags", 2)
    response.should have_tag("tr>td", "value for reference_medium", 2)
    response.should have_tag("tr>td", "value for notes", 2)
  end
end
