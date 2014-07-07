require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  should belong_to(:user)
  should have_many(:tasks)
  

end
