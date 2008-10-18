require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BibliographiesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "bibliographies", :action => "index").should == "/bibliographies"
    end
  
    it "should map #new" do
      route_for(:controller => "bibliographies", :action => "new").should == "/bibliographies/new"
    end
  
    it "should map #show" do
      route_for(:controller => "bibliographies", :action => "show", :id => 1).should == "/bibliographies/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "bibliographies", :action => "edit", :id => 1).should == "/bibliographies/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "bibliographies", :action => "update", :id => 1).should == "/bibliographies/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "bibliographies", :action => "destroy", :id => 1).should == "/bibliographies/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/bibliographies").should == {:controller => "bibliographies", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/bibliographies/new").should == {:controller => "bibliographies", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/bibliographies").should == {:controller => "bibliographies", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/bibliographies/1").should == {:controller => "bibliographies", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/bibliographies/1/edit").should == {:controller => "bibliographies", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/bibliographies/1").should == {:controller => "bibliographies", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/bibliographies/1").should == {:controller => "bibliographies", :action => "destroy", :id => "1"}
    end
  end
end
