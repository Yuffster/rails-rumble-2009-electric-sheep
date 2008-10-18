require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/citations/new.html.erb" do
  include CitationsHelper

  before(:each) do
    assigns[:citation] = stub_model(Citation,
      :new_record? => true,
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
  end

  it "should render new form" do
    render "/citations/new.html.erb"

    response.should have_tag("form[action=?][method=post]", citations_path) do
      with_tag("input#citation_title[name=?]", "citation[title]")
      with_tag("input#citation_publication_title[name=?]", "citation[publication_title]")
      with_tag("input#citation_editor[name=?]", "citation[editor]")
      with_tag("input#citation_publisher[name=?]", "citation[publisher]")
      with_tag("input#citation_publishing_city[name=?]", "citation[publishing_city]")
      with_tag("input#citation_pages[name=?]", "citation[pages]")
      with_tag("input#citation_imported_from[name=?]", "citation[imported_from]")
      with_tag("input#citation_volume[name=?]", "citation[volume]")
      with_tag("input#citation_issue[name=?]", "citation[issue]")
      with_tag("input#citation_tags[name=?]", "citation[tags]")
      with_tag("input#citation_reference_medium[name=?]", "citation[reference_medium]")
      with_tag("textarea#citation_notes[name=?]", "citation[notes]")
    end
  end
end
