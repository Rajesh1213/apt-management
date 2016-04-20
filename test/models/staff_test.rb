require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save staff without information" do
    staff = Staff.new
    assert_not staff.save
  end
end
