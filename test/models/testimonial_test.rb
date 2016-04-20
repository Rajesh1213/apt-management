require 'test_helper'

class TestimonialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save testimonial without content" do
     testimonial = Testimonial.new(:content=> "")
     assert !testimonial.save
   end

   test "should not save testimonial without date" do
      testimonial = Testimonial.new(:date_entered=> "")
      assert !testimonial.save
    end

end
