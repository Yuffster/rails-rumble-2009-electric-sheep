require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitationsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "citations", :action => "index").should == "/citations"
    end
  
    it "should map #new" do
      route_for(:controller => "citations", :action => "new").should == "/citations/new"
    end
  
    it "should map #show" do
      route_for(:controller => "citations", :action => "show", :id => 1).should == "/citations/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "citations", :action => "edit", :id => 1).should == "/citations/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "citations", :action => "update", :id => 1).should == "/citations/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "citations", :action => "destroy", :id => 1).should == "/citations/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/citations").should == {:controller => "citations", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/citations/new").should == {:controller => "citations", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/citations").should == {:controller => "citations", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/citations/1").should == {:controller => "citations", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/citations/1/edit").should == {:controller => "citations", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/citations/1").should == {:controller => "citations", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/citations/1").should == {:controller => "citations", :action => "destroy", :id => "1"}
    end
  end
end
