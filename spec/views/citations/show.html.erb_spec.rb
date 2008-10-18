require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/citations/show.html.erb" do
  include CitationsHelper

  before(:each) do
    assigns[:citation] = @citation = stub_model(Citation,
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

  it "should render attributes in <p>" do
    render "/citations/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ publication_title/)
    response.should have_text(/value\ for\ editor/)
    response.should have_text(/value\ for\ publisher/)
    response.should have_text(/value\ for\ publishing_city/)
    response.should have_text(/value\ for\ pages/)
    response.should have_text(/value\ for\ imported_from/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ tags/)
    response.should have_text(/value\ for\ reference_medium/)
    response.should have_text(/value\ for\ notes/)
  end
end
