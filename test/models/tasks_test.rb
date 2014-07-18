require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "should save with project association" do 
    task = tasks(:task_one)
    assert task.save
  end

  # test "should not save without project association" do 
  #   task = tasks(:bad_task)
  #   refute task.save
  # end

end
