require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: 'test@test.com')
    @project = Project.new(user_id: @user.id, title: 'awesome test', completed: false)
  end

  test "should belong to user" do
    assert @project.user
  end

end
