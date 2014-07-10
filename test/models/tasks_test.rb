require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "should not save without project association" do 
    task = Task.new(project_id: nil)
    assert_not task.save
  end

end
