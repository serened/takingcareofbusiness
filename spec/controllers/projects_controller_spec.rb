require 'spec_helper'

describe ProjectsController do
  
  context 'with user logged in' do

    before do
      @user = User.last
      @project = Project.where(user_id: @user.id).first
      get :index
    end

    describe "GET index" do
      it "assigns @projects" do
        expect(assigns(:projects))
      end
    end

    describe "GET new" do
      it "can create a new project" do
        get :new
        response.should be_success
      end
    end

    # describe "POST create" do
    #   it "can create a new project" do
    #     post :create, :project => { :user_id = @user.id, :title: 'test', note: 'thing' }
    #     @project = Project.new

    #     expect(assigns(:project))
    #     response.should redirect_to(user_projects_path(@user.id))
    #   end
    # end
  end


    context 'with no user logged in' do

      before do
        get :index
      end

      describe "GET index" do
        it "do not assign @projects" do
          expect(assigns(:projects)).to be_nil
        end

        it "does not render the index template" do
          response.should redirect_to(log_me_in_path)
        end
      end
    end

end
