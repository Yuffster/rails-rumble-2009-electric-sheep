require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StylesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "styles", :action => "index").should == "/styles"
    end
  
    it "should map #new" do
      route_for(:controller => "styles", :action => "new").should == "/styles/new"
    end
  
    it "should map #show" do
      route_for(:controller => "styles", :action => "show", :id => 1).should == "/styles/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "styles", :action => "edit", :id => 1).should == "/styles/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "styles", :action => "update", :id => 1).should == "/styles/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "styles", :action => "destroy", :id => 1).should == "/styles/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/styles").should == {:controller => "styles", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/styles/new").should == {:controller => "styles", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/styles").should == {:controller => "styles", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/styles/1").should == {:controller => "styles", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/styles/1/edit").should == {:controller => "styles", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/styles/1").should == {:controller => "styles", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/styles/1").should == {:controller => "styles", :action => "destroy", :id => "1"}
    end
  end
end
