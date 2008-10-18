require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BibliographiesController do

  def mock_bibliography(stubs={})
    @mock_bibliography ||= mock_model(Bibliography, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all bibliographies as @bibliographies" do
      Bibliography.should_receive(:find).with(:all).and_return([mock_bibliography])
      get :index
      assigns[:bibliographies].should == [mock_bibliography]
    end

    describe "with mime type of xml" do
  
      it "should render all bibliographies as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Bibliography.should_receive(:find).with(:all).and_return(bibliographies = mock("Array of Bibliographies"))
        bibliographies.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested bibliography as @bibliography" do
      Bibliography.should_receive(:find).with("37").and_return(mock_bibliography)
      get :show, :id => "37"
      assigns[:bibliography].should equal(mock_bibliography)
    end
    
    describe "with mime type of xml" do

      it "should render the requested bibliography as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Bibliography.should_receive(:find).with("37").and_return(mock_bibliography)
        mock_bibliography.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new bibliography as @bibliography" do
      Bibliography.should_receive(:new).and_return(mock_bibliography)
      get :new
      assigns[:bibliography].should equal(mock_bibliography)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested bibliography as @bibliography" do
      Bibliography.should_receive(:find).with("37").and_return(mock_bibliography)
      get :edit, :id => "37"
      assigns[:bibliography].should equal(mock_bibliography)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created bibliography as @bibliography" do
        Bibliography.should_receive(:new).with({'these' => 'params'}).and_return(mock_bibliography(:save => true))
        post :create, :bibliography => {:these => 'params'}
        assigns(:bibliography).should equal(mock_bibliography)
      end

      it "should redirect to the created bibliography" do
        Bibliography.stub!(:new).and_return(mock_bibliography(:save => true))
        post :create, :bibliography => {}
        response.should redirect_to(bibliography_url(mock_bibliography))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved bibliography as @bibliography" do
        Bibliography.stub!(:new).with({'these' => 'params'}).and_return(mock_bibliography(:save => false))
        post :create, :bibliography => {:these => 'params'}
        assigns(:bibliography).should equal(mock_bibliography)
      end

      it "should re-render the 'new' template" do
        Bibliography.stub!(:new).and_return(mock_bibliography(:save => false))
        post :create, :bibliography => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested bibliography" do
        Bibliography.should_receive(:find).with("37").and_return(mock_bibliography)
        mock_bibliography.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bibliography => {:these => 'params'}
      end

      it "should expose the requested bibliography as @bibliography" do
        Bibliography.stub!(:find).and_return(mock_bibliography(:update_attributes => true))
        put :update, :id => "1"
        assigns(:bibliography).should equal(mock_bibliography)
      end

      it "should redirect to the bibliography" do
        Bibliography.stub!(:find).and_return(mock_bibliography(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(bibliography_url(mock_bibliography))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested bibliography" do
        Bibliography.should_receive(:find).with("37").and_return(mock_bibliography)
        mock_bibliography.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bibliography => {:these => 'params'}
      end

      it "should expose the bibliography as @bibliography" do
        Bibliography.stub!(:find).and_return(mock_bibliography(:update_attributes => false))
        put :update, :id => "1"
        assigns(:bibliography).should equal(mock_bibliography)
      end

      it "should re-render the 'edit' template" do
        Bibliography.stub!(:find).and_return(mock_bibliography(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested bibliography" do
      Bibliography.should_receive(:find).with("37").and_return(mock_bibliography)
      mock_bibliography.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the bibliographies list" do
      Bibliography.stub!(:find).and_return(mock_bibliography(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bibliographies_url)
    end

  end

end
