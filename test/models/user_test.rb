require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save user without email" do
      user = User.new(:email=> "")
      assert !user.save
    end

    test "should not save user with invalid email" do
       user = User.new(:email=> "lien")
       assert !user.save
    end

    test "should not save user without password" do
       user = User.new(:encrypted_password=> "")
       assert !user.save
    end

    test "should not save user with short password" do
        user = User.new(:encrypted_password=> "short")
        assert !user.save
    end

    test "should not save user with invalid password" do
        user = User.new(:encrypted_password=> "1")
        assert !user.save
    end

end
