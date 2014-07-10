require 'spec_helper'

describe TasksController do
  
  context 'with user logged in' do

    before do
      @user = User.first
      @project = @user.projects.first
    end

    describe "GET index" do
      it "assigns @tasks" do
        get :index, project_id: @project.id
        expect(assigns(:tasks))
      end
    end

    describe "GET new" do
      it "can create a new task" do
        get :new
        response.should be_success
      end
    end
  end


    context 'with no user logged in' do

      before do
        get :index
      end

      describe "GET index" do
        it "do not assign @tasks" do
          expect(assigns(:tasks)).to be_nil
        end

        it "does not render the index template" do
          response.should redirect_to(log_me_in_path)
        end
      end
    end

end
