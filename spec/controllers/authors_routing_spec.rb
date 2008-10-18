require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthorsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "authors", :action => "index").should == "/authors"
    end
  
    it "should map #new" do
      route_for(:controller => "authors", :action => "new").should == "/authors/new"
    end
  
    it "should map #show" do
      route_for(:controller => "authors", :action => "show", :id => 1).should == "/authors/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "authors", :action => "edit", :id => 1).should == "/authors/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "authors", :action => "update", :id => 1).should == "/authors/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "authors", :action => "destroy", :id => 1).should == "/authors/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/authors").should == {:controller => "authors", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/authors/new").should == {:controller => "authors", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/authors").should == {:controller => "authors", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/authors/1").should == {:controller => "authors", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/authors/1/edit").should == {:controller => "authors", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/authors/1").should == {:controller => "authors", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/authors/1").should == {:controller => "authors", :action => "destroy", :id => "1"}
    end
  end
end
