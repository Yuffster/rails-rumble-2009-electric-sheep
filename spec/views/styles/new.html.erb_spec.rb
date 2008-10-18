require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/new.html.erb" do
  include StylesHelper

  before(:each) do
    assigns[:style] = stub_model(Style,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description")
  end

  it "should render new form" do
    render "/styles/new.html.erb"

    response.should have_tag("form[action=?][method=post]", styles_path) do
      with_tag("input#style_name[name=?]", "style[name]")
      with_tag("textarea#style_description[name=?]", "style[description]")
    end
  end
end
