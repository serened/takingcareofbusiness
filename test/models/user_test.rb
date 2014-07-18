require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save without email address" do 
    user = users(:bad_user)
    assert_not user.save
  end

  test "should save with email address" do
    user = users(:user_one)
    assert user.save
  end

end
