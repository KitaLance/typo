require 'spec_helper'

describe Admin::CategoriesController do
  render_views

  before(:each) do
    Factory(:blog)
    #TODO Delete after removing fixtures
    Profile.delete_all
    henri = Factory(:user, :login => 'henri', :profile => Factory(:profile_admin, :label => Profile::ADMIN))
    request.session = { :user => henri.id }
  end
  
  describe "test_new" do
    context "When create a category" do
      it "should enter the new page" do
          get :new
          expect(response).to render_template(:new)
      end

      it "should enter the new page" do
          post :new, { :category => {"name" => 'TestName',
                  "permalink" => 'testname',
                  "keywords" => 'estKeyworkd1, TestKeyworkd2, TestKeyworkd3',
                  "description" => 'This is a test description'} }
          assert_response :redirect, :action => 'new'
      end
    end
  end
end
