require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitationsController do

  def mock_citation(stubs={})
    @mock_citation ||= mock_model(Citation, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all citations as @citations" do
      Citation.should_receive(:find).with(:all).and_return([mock_citation])
      get :index
      assigns[:citations].should == [mock_citation]
    end

    describe "with mime type of xml" do
  
      it "should render all citations as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Citation.should_receive(:find).with(:all).and_return(citations = mock("Array of Citations"))
        citations.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested citation as @citation" do
      Citation.should_receive(:find).with("37").and_return(mock_citation)
      get :show, :id => "37"
      assigns[:citation].should equal(mock_citation)
    end
    
    describe "with mime type of xml" do

      it "should render the requested citation as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Citation.should_receive(:find).with("37").and_return(mock_citation)
        mock_citation.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new citation as @citation" do
      Citation.should_receive(:new).and_return(mock_citation)
      get :new
      assigns[:citation].should equal(mock_citation)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested citation as @citation" do
      Citation.should_receive(:find).with("37").and_return(mock_citation)
      get :edit, :id => "37"
      assigns[:citation].should equal(mock_citation)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created citation as @citation" do
        Citation.should_receive(:new).with({'these' => 'params'}).and_return(mock_citation(:save => true))
        post :create, :citation => {:these => 'params'}
        assigns(:citation).should equal(mock_citation)
      end

      it "should redirect to the created citation" do
        Citation.stub!(:new).and_return(mock_citation(:save => true))
        post :create, :citation => {}
        response.should redirect_to(citation_url(mock_citation))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved citation as @citation" do
        Citation.stub!(:new).with({'these' => 'params'}).and_return(mock_citation(:save => false))
        post :create, :citation => {:these => 'params'}
        assigns(:citation).should equal(mock_citation)
      end

      it "should re-render the 'new' template" do
        Citation.stub!(:new).and_return(mock_citation(:save => false))
        post :create, :citation => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested citation" do
        Citation.should_receive(:find).with("37").and_return(mock_citation)
        mock_citation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :citation => {:these => 'params'}
      end

      it "should expose the requested citation as @citation" do
        Citation.stub!(:find).and_return(mock_citation(:update_attributes => true))
        put :update, :id => "1"
        assigns(:citation).should equal(mock_citation)
      end

      it "should redirect to the citation" do
        Citation.stub!(:find).and_return(mock_citation(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(citation_url(mock_citation))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested citation" do
        Citation.should_receive(:find).with("37").and_return(mock_citation)
        mock_citation.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :citation => {:these => 'params'}
      end

      it "should expose the citation as @citation" do
        Citation.stub!(:find).and_return(mock_citation(:update_attributes => false))
        put :update, :id => "1"
        assigns(:citation).should equal(mock_citation)
      end

      it "should re-render the 'edit' template" do
        Citation.stub!(:find).and_return(mock_citation(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested citation" do
      Citation.should_receive(:find).with("37").and_return(mock_citation)
      mock_citation.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the citations list" do
      Citation.stub!(:find).and_return(mock_citation(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(citations_url)
    end

  end

end
