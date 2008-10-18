require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/styles/edit.html.erb" do
  include StylesHelper

  before(:each) do
    assigns[:style] = @style = stub_model(Style,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description")
  end

  it "should render edit form" do
    render "/styles/edit.html.erb"

    response.should have_tag("form[action=#{style_path(@style)}][method=post]") do
      with_tag('input#style_name[name=?]', "style[name]")
      with_tag('textarea#style_description[name=?]', "style[description]")
    end
  end
end
