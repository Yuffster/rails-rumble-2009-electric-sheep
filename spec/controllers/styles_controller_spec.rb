require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StylesController do

  def mock_style(stubs={})
    @mock_style ||= mock_model(Style, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all styles as @styles" do
      Style.should_receive(:find).with(:all).and_return([mock_style])
      get :index
      assigns[:styles].should == [mock_style]
    end

    describe "with mime type of xml" do
  
      it "should render all styles as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Style.should_receive(:find).with(:all).and_return(styles = mock("Array of Styles"))
        styles.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested style as @style" do
      Style.should_receive(:find).with("37").and_return(mock_style)
      get :show, :id => "37"
      assigns[:style].should equal(mock_style)
    end
    
    describe "with mime type of xml" do

      it "should render the requested style as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Style.should_receive(:find).with("37").and_return(mock_style)
        mock_style.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new style as @style" do
      Style.should_receive(:new).and_return(mock_style)
      get :new
      assigns[:style].should equal(mock_style)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested style as @style" do
      Style.should_receive(:find).with("37").and_return(mock_style)
      get :edit, :id => "37"
      assigns[:style].should equal(mock_style)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created style as @style" do
        Style.should_receive(:new).with({'these' => 'params'}).and_return(mock_style(:save => true))
        post :create, :style => {:these => 'params'}
        assigns(:style).should equal(mock_style)
      end

      it "should redirect to the created style" do
        Style.stub!(:new).and_return(mock_style(:save => true))
        post :create, :style => {}
        response.should redirect_to(style_url(mock_style))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved style as @style" do
        Style.stub!(:new).with({'these' => 'params'}).and_return(mock_style(:save => false))
        post :create, :style => {:these => 'params'}
        assigns(:style).should equal(mock_style)
      end

      it "should re-render the 'new' template" do
        Style.stub!(:new).and_return(mock_style(:save => false))
        post :create, :style => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested style" do
        Style.should_receive(:find).with("37").and_return(mock_style)
        mock_style.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :style => {:these => 'params'}
      end

      it "should expose the requested style as @style" do
        Style.stub!(:find).and_return(mock_style(:update_attributes => true))
        put :update, :id => "1"
        assigns(:style).should equal(mock_style)
      end

      it "should redirect to the style" do
        Style.stub!(:find).and_return(mock_style(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(style_url(mock_style))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested style" do
        Style.should_receive(:find).with("37").and_return(mock_style)
        mock_style.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :style => {:these => 'params'}
      end

      it "should expose the style as @style" do
        Style.stub!(:find).and_return(mock_style(:update_attributes => false))
        put :update, :id => "1"
        assigns(:style).should equal(mock_style)
      end

      it "should re-render the 'edit' template" do
        Style.stub!(:find).and_return(mock_style(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested style" do
      Style.should_receive(:find).with("37").and_return(mock_style)
      mock_style.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the styles list" do
      Style.stub!(:find).and_return(mock_style(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(styles_url)
    end

  end

end
