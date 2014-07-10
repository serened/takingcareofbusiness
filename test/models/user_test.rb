require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save without email address" do 
    user = User.new
    assert_not user.save
  end

  test "should save with email address" do
    user = User.new(email: 'test@test.com', password_hash: '$2a$10$uTPVC4dnvPLzqbAMkYozXOVe/eMpN3qMeo3K1UBJH0d', password_salt: '$2a$10$uTPVC4dnvPLzqbAMkYozXO')
    assert user.save
  end

end
