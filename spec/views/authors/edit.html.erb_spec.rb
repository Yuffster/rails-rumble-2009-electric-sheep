require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/authors/edit.html.erb" do
  include AuthorsHelper

  before(:each) do
    assigns[:author] = @author = stub_model(Author,
      :new_record? => false,
      :name => "value for name")
  end

  it "should render edit form" do
    render "/authors/edit.html.erb"

    response.should have_tag("form[action=#{author_path(@author)}][method=post]") do
      with_tag('input#author_name[name=?]', "author[name]")
    end
  end
end
