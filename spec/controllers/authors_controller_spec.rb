require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthorsController do

  def mock_author(stubs={})
    @mock_author ||= mock_model(Author, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all authors as @authors" do
      Author.should_receive(:find).with(:all).and_return([mock_author])
      get :index
      assigns[:authors].should == [mock_author]
    end

    describe "with mime type of xml" do
  
      it "should render all authors as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Author.should_receive(:find).with(:all).and_return(authors = mock("Array of Authors"))
        authors.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested author as @author" do
      Author.should_receive(:find).with("37").and_return(mock_author)
      get :show, :id => "37"
      assigns[:author].should equal(mock_author)
    end
    
    describe "with mime type of xml" do

      it "should render the requested author as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Author.should_receive(:find).with("37").and_return(mock_author)
        mock_author.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new author as @author" do
      Author.should_receive(:new).and_return(mock_author)
      get :new
      assigns[:author].should equal(mock_author)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested author as @author" do
      Author.should_receive(:find).with("37").and_return(mock_author)
      get :edit, :id => "37"
      assigns[:author].should equal(mock_author)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created author as @author" do
        Author.should_receive(:new).with({'these' => 'params'}).and_return(mock_author(:save => true))
        post :create, :author => {:these => 'params'}
        assigns(:author).should equal(mock_author)
      end

      it "should redirect to the created author" do
        Author.stub!(:new).and_return(mock_author(:save => true))
        post :create, :author => {}
        response.should redirect_to(author_url(mock_author))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved author as @author" do
        Author.stub!(:new).with({'these' => 'params'}).and_return(mock_author(:save => false))
        post :create, :author => {:these => 'params'}
        assigns(:author).should equal(mock_author)
      end

      it "should re-render the 'new' template" do
        Author.stub!(:new).and_return(mock_author(:save => false))
        post :create, :author => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested author" do
        Author.should_receive(:find).with("37").and_return(mock_author)
        mock_author.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :author => {:these => 'params'}
      end

      it "should expose the requested author as @author" do
        Author.stub!(:find).and_return(mock_author(:update_attributes => true))
        put :update, :id => "1"
        assigns(:author).should equal(mock_author)
      end

      it "should redirect to the author" do
        Author.stub!(:find).and_return(mock_author(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(author_url(mock_author))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested author" do
        Author.should_receive(:find).with("37").and_return(mock_author)
        mock_author.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :author => {:these => 'params'}
      end

      it "should expose the author as @author" do
        Author.stub!(:find).and_return(mock_author(:update_attributes => false))
        put :update, :id => "1"
        assigns(:author).should equal(mock_author)
      end

      it "should re-render the 'edit' template" do
        Author.stub!(:find).and_return(mock_author(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested author" do
      Author.should_receive(:find).with("37").and_return(mock_author)
      mock_author.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the authors list" do
      Author.stub!(:find).and_return(mock_author(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(authors_url)
    end

  end

end
