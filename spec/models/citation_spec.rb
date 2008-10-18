require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Citation do
  before(:each) do
    @valid_attributes = {
      :bibliography_id => "1",
      :title => "value for title",
      :publication_title => "value for publication_title",
      :editor => "value for editor",
      :date => Time.now,
      :publisher => "value for publisher",
      :publishing_city => "value for publishing_city",
      :pages => "value for pages",
      :imported_from => "value for imported_from",
      :imported_at => Time.now,
      :volume => "1",
      :issue => "1",
      :tags => "value for tags",
      :reference_medium => "value for reference_medium",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Citation.create!(@valid_attributes)
  end
end
